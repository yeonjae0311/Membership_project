package com.korea.membership;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.BoardDAO;
import dao.CartDetailDAO;
import dao.ItemDAO;
import dao.OrderDetailDAO;
import dao.PMemberDAO;
import dao.POrderDAO;
import util.Path;
import vo.ItemVO;
import vo.PMemberVO;

@Controller
public class ShopController {

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;

	ItemDAO item_dao;
	CartDetailDAO cart_detail_dao;
	BoardDAO board_dao;
	PMemberDAO pmember_dao;
	POrderDAO porder_dao;
	OrderDetailDAO order_detail_dao;

	public ShopController(ItemDAO item_dao, CartDetailDAO cart_detail_dao, 
						  BoardDAO board_dao, PMemberDAO pmember_dao,
						  POrderDAO porder_dao, OrderDetailDAO order_detail_dao) {
		
		this.item_dao = item_dao;
		this.cart_detail_dao = cart_detail_dao;
		this.board_dao = board_dao;
		this.pmember_dao = pmember_dao;
		this.porder_dao = porder_dao;
		this.order_detail_dao = order_detail_dao;
	}

	@RequestMapping("shop")
	public String shop(Model model) {
		PMemberVO vo = (PMemberVO) session.getAttribute("id");
		int m_idx = vo.getM_idx();

		// idx로 마스터 계정인지 판별하는 메서드 자리(이미 만든거 가져다 쓰기)
		// 반환된 int를 model에 바인딩해서 해당 값으로 shop의 상품 등록하기 버튼 숨기기
		int is_master = board_dao.is_master(m_idx);

		List<ItemVO> list = item_dao.item_list_select();

		model.addAttribute("list", list);
		model.addAttribute("is_master", is_master);

		return Path.ShopPath.make_path("shop");
	}

	@RequestMapping("shopping_cart_insert")
	@ResponseBody
	public String shopping_cart_insert(@RequestBody String body) throws UnsupportedEncodingException {
		ObjectMapper om = new ObjectMapper();

		Map<String, String> data = null;

		try {
			data = om.readValue(body, new TypeReference<Map<String, String>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}

		String i_color = data.get("i_color");
		String i_name = URLDecoder.decode(data.get("i_name"), "utf-8");
		int cd_count = Integer.parseInt(data.get("cd_count"));

		session = request.getSession();
		PMemberVO p_member_vo = (PMemberVO) session.getAttribute("id");

		// i_name과 i_color로 i_idx를 조회
		HashMap<String, String> i_map = new HashMap<String, String>();
		i_map.put("i_name", i_name);
		i_map.put("i_color", i_color);

		ItemVO item_vo = item_dao.item_find_idx(i_map);
		int i_idx = item_vo.getI_idx();
		int m_idx = p_member_vo.getM_idx();

		// i_idx와 m_idx를 map으로 묶어 cart_detail table에 insert 하기
		HashMap<String, Integer> idx_map = new HashMap<String, Integer>();
		idx_map.put("i_idx", i_idx);
		idx_map.put("m_idx", m_idx);
		idx_map.put("cd_count", cd_count);

		cart_detail_dao.cart_insert(idx_map);

		// i_amount를 가져와서 update문 한번 수행
		// --> 수행이 되었으면(update) 페이지 이돟 후 alert로 '구매가능최대수량으로 변경되었습니다.'
		// --> 수행이 안되었으면 페이지 이동

		int i_amount = item_vo.getI_amount();
		int res = cart_detail_dao.cd_count_check(i_amount);

		if (res > 0) {
			return "{\"param\": \"success\"}";
		} else {
			return "{\"param\": \"fail\"}";
		}
	}

	@RequestMapping("shopping_cart")
	public String shopping_cart(Model model) {

		session = request.getSession();
		PMemberVO p_member_vo = (PMemberVO) session.getAttribute("id");
		int m_idx = p_member_vo.getM_idx();

		// 장바구니 테이블을 전체 조회해서 바인딩
		List<ItemVO> list = cart_detail_dao.cart_select_list(m_idx);

		model.addAttribute("list", list);

		return Path.ShopPath.make_path("shopping_cart");
	}

	@RequestMapping(value = "shopping_cart_list", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String shopping_cart_list() throws UnsupportedEncodingException {
		ObjectMapper om = new ObjectMapper();

		PMemberVO pmember_vo = (PMemberVO) session.getAttribute("id");

		int m_idx = pmember_vo.getM_idx();

		List<ItemVO> list = cart_detail_dao.cart_select_list(m_idx);

		String json_array = null;

		try {
			json_array = om.writeValueAsString(list);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return json_array;
	}

	@RequestMapping("item_insert")
	public String item_insert() {
		return Path.ShopPath.make_path("item_insert");
	}

	@RequestMapping("item_insert_upload")
	public String item_insert_upload(ItemVO vo) {

		String webPath = "/resources/upload/shop/";
		String savePath = request.getServletContext().getRealPath(webPath);

		MultipartFile i_photo = vo.getI_photo();
		String i_photo_name = "no_file";

		MultipartFile i_detail_photo = vo.getI_detail_photo();
		String i_detail_photo_name = "no_file";

		if (!i_photo.isEmpty()) {
			// photo.getOriginalFilename() : 업로드된 실제 파일명
			i_photo_name = i_photo.getOriginalFilename();
			i_detail_photo_name = i_detail_photo.getOriginalFilename();

			// 파일을 저장할 경로 지정
			File saveFile_photo = new File(savePath, i_photo_name);
			File saveFile_detail_photo = new File(savePath, i_detail_photo_name);

			if (!saveFile_photo.exists()) {
				saveFile_photo.mkdirs();
				saveFile_detail_photo.mkdirs();
			} else {
				long time = System.currentTimeMillis();
				i_photo_name = String.format("%d_%s", time, i_photo_name);
				i_detail_photo_name = String.format("%d_%s", time, i_detail_photo_name);
				saveFile_photo = new File(savePath, i_photo_name);
				saveFile_detail_photo = new File(savePath, i_detail_photo_name);
			}
			try {
				i_photo.transferTo(saveFile_photo);
				i_detail_photo.transferTo(saveFile_detail_photo);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		vo.setI_photo_name(i_photo_name);
		vo.setI_detail_photo_name(i_detail_photo_name);

		int res = item_dao.item_upload(vo);

		if (res > 0) {
			return "redirect:shop";
		}

		return null;
	}

	@RequestMapping("shop_item")
	public String shop_item(Model model, int i_idx, String i_name) {

		ItemVO vo = item_dao.item_select_one(i_idx);
		List<String> colors = item_dao.item_select_color(i_name);

		model.addAttribute("vo", vo);
		model.addAttribute("colors", colors);

		return Path.ShopPath.make_path("shop_item");
	}

	@RequestMapping("select_option")
	@ResponseBody
	public String select_option(@RequestBody String body) throws UnsupportedEncodingException {
		ObjectMapper om = new ObjectMapper();

		Map<String, String> data = null;

		try {
			data = om.readValue(body, new TypeReference<Map<String, String>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}

		String i_name = URLDecoder.decode(data.get("i_name"), "utf-8");

		List<String> colors = item_dao.item_select_color(i_name);

		String json_array = null;

		try {
			json_array = om.writeValueAsString(colors);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return json_array;
	}

	@RequestMapping("item_count_change")
	@ResponseBody
	public String item_count_change(@RequestBody String body) {
		ObjectMapper om = new ObjectMapper();

		Map<String, String> data = null;

		try {
			data = om.readValue(body, new TypeReference<Map<String, String>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}

		int cd_count = Integer.parseInt(data.get("item_count"));
		int i_idx = Integer.parseInt(data.get("i_idx"));

		session = request.getSession();
		PMemberVO p_member_vo = (PMemberVO) session.getAttribute("id");
		int m_idx = p_member_vo.getM_idx();

		// i_dx와 m_idx에 알맞은 cd_count를 변경
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("i_idx", i_idx);
		map.put("m_idx", m_idx);
		map.put("cd_count", cd_count);

		int res = cart_detail_dao.cart_item_count_change(map);

		if (res > 0) {
			return "{\"param\": \"yes\"}";
		} else {
			return "{\"param\": \"no\"}";
		}
	}

	@RequestMapping("item_delete")
	@ResponseBody
	public String item_delete(@RequestBody String body) throws UnsupportedEncodingException {
		ObjectMapper om = new ObjectMapper();

		Map<String, String> data = null;

		try {
			data = om.readValue(body, new TypeReference<Map<String, String>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}

		String i_name = URLDecoder.decode(data.get("i_name"), "utf-8");

		int res = item_dao.item_delete(i_name);

		if (res > 0) {
			return "{\"param\": \"success\"}";
		} else {
			return "{\"param\": \"fail\"}";
		}
	}

	@RequestMapping("shop_payment")
	public String shop_payment(Model model) {

		// m_idx에 해당하는 유저정보 조회해서 바인딩

		int m_idx = (int) session.getAttribute("m_idx");

		PMemberVO vo = pmember_dao.select_one(m_idx);

		model.addAttribute("vo", vo);

		return Path.ShopPath.make_path("shop_payment");
	}
	
	
	@RequestMapping("cart_delete")
	@ResponseBody
	public String cart_delete(@RequestBody String body) {
		ObjectMapper om = new ObjectMapper();
			
		Map<String, String> data = null;
		
		try {
			data = om.readValue(body, new TypeReference<Map<String, String>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int i_idx = Integer.parseInt(data.get("i_idx"));
		int m_idx = (int) session.getAttribute("m_idx");
		
		HashMap<String, Integer> idx_map = new HashMap<String,Integer>();
		idx_map.put("i_idx", i_idx);
		idx_map.put("m_idx", m_idx);
		
		int res = cart_detail_dao.cart_delete(idx_map);
		
		if(res > 0) {
			return "{\"param\": \"success\"}";
		} else {
			return "{\"param\": \"fail\"}";
		}
	}
	

	@RequestMapping("membership_payment_completed")
	public String payment_completed(Model model) {
		
		PMemberVO vo = (PMemberVO) session.getAttribute("id");
		
		int m_idx = vo.getM_idx();
		item_dao.membership_buy(m_idx);
		
		int o_sum = 9900; 
		int o_count = 1;
		
		Map<String, Object> map_order = new HashMap<String, Object>();
		map_order.put("o_sum", o_sum); map_order.put("o_count", o_count);
		map_order.put("m_idx", m_idx);
		 
		porder_dao.order_insert(map_order);
		  
		Map<String, Object> map_detail = new HashMap<String, Object>();
		
		int i_idx = 24; // 멤버쉽 1개월 상품을 등록하고 i_idx를 지정해두어야함 
		// 여기서 오류나면 item을 다지우고 첫번째 상품으로 멤버십 상품을 등록해주세요
		int od_count = 1; 
		int od_sum = 9900;
		 
		map_detail.put("i_idx", i_idx); map_detail.put("od_count", od_count);
		map_detail.put("od_sum", od_sum); map_detail.put("m_idx", m_idx);
		
		order_detail_dao.order_detail_insert(map_detail);
		
		return Path.ShopPath.make_path("payment_completed");
	}

	
	@RequestMapping("payment_completed")
	@ResponseBody
	public String payment_completed(@RequestBody String body) throws ParseException {
		
		JSONParser parser = new JSONParser();
		JSONObject object = (JSONObject) parser.parse(body);
		String obj = String.valueOf(object.get("order_list_json"));
		JSONObject object_new = (JSONObject) parser.parse(obj);
		
	    JSONObject total_count = (JSONObject) object_new.get("total_count");	
	    String o_sum_str = String.valueOf(total_count.get("final_price"));
	    String o_count_str = String.valueOf(total_count.get("total_amount"));
		   
	    int o_sum = Integer.parseInt(o_sum_str);
		int o_count = Integer.parseInt(o_count_str);
		int m_idx = (int) session.getAttribute("m_idx");
		   
		Map<String, Object> map_order = new HashMap<String, Object>();
		map_order.put("o_sum", o_sum);
		map_order.put("o_count", o_count);
		map_order.put("m_idx", m_idx);
		   
		JSONArray items = (JSONArray)object_new.get("items");
		   
		porder_dao.order_insert(map_order);
		   	   
		for(int i = 0 ; i<items.size();i++){	   
			   
		   Map<String, Object> map_detail = new HashMap<String, Object>();
		   
		   object = (JSONObject) items.get(i);
           int i_idx = Integer.parseInt(String.valueOf(object.get("i_idx"))); 
           int od_count = Integer.parseInt(String.valueOf(object.get("od_count"))); 
           int od_sum = Integer.parseInt(String.valueOf(object.get("od_sum"))); 
             
           map_detail.put("i_idx", i_idx);
           map_detail.put("od_count", od_count);
           map_detail.put("od_sum", od_sum);
           map_detail.put("m_idx", m_idx);        
           
           order_detail_dao.order_detail_insert(map_detail);
		}	   	   	   
		
		return "{\"param\": \"success\"}";
	}
	
	@RequestMapping("completed_page")
	public String completed_page(Model model) {
		
		LocalDateTime now = LocalDateTime.now();

		String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 HH시 mm분 ss초"));
		
		int m_idx = (int) session.getAttribute("m_idx");
		
		int o_idx = porder_dao.o_idx_select(m_idx);
		
		model.addAttribute("order_date", formatedNow);
		model.addAttribute("order_num", o_idx);
		
		return Path.ShopPath.make_path("payment_completed");
	}
	
	@RequestMapping("membership_shop_payment")
	public String membership_shop_payment() {
		return Path.ShopPath.make_path("membership_shop_payment");
	}
	
	@RequestMapping("kakao")
	@ResponseBody
	public String kakao_payment(@RequestBody String body) {
		ObjectMapper om = new ObjectMapper();
		
		Map<String, String> data = null;
		
		try {
			data = om.readValue(body, new TypeReference<Map<String, String>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String o_sum = data.get("o_sum");
		String payment_name = "NEWJEANS MEMBERSHIP PAYMENT";
		
		session.setAttribute("payment_name", payment_name);
		session.setAttribute("payment_price", o_sum);
		
		return "{\"param\": \"success\"}";
	}

	@RequestMapping("membership_kakao_pay")
	public String membership_kakao_pay() {

		return Path.ShopPath.make_path("membership_kakao_pay");
	}
	
}