package com.korea.membership;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import dao.PMemberDAO;
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

	public ShopController(ItemDAO item_dao, CartDetailDAO cart_detail_dao, BoardDAO board_dao, PMemberDAO pmember_dao) {
		this.item_dao = item_dao;
		this.cart_detail_dao = cart_detail_dao;
		this.board_dao = board_dao;
		this.pmember_dao = pmember_dao;
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
		HashMap<String, Integer> idx_map = new HashMap<String,Integer>();
		idx_map.put("i_idx", i_idx);
		idx_map.put("m_idx", m_idx);
		idx_map.put("cd_count", cd_count);
		
		int insert = cart_detail_dao.cart_insert(idx_map);
		
		// i_amount를 가져와서 update문 한번 수행
		// --> 수행이 되었으면(update) 페이지 이돟 후 alert로 '구매가능최대수량으로 변경되었습니다.'
		// --> 수행이 안되었으면 페이지 이동
		
		int i_amount = item_vo.getI_amount();
		int res = cart_detail_dao.cd_count_check(i_amount);
		
		if(res > 0) {
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
	
	@RequestMapping(value="shopping_cart_list", produces="application/text; charset=UTF-8")
	@ResponseBody
	public String shopping_cart_list() throws UnsupportedEncodingException {
		ObjectMapper om = new ObjectMapper();
		
		PMemberVO pmember_vo = (PMemberVO) session.getAttribute("id");
		
		int m_idx = pmember_vo.getM_idx();
		
		List<ItemVO> list = cart_detail_dao.cart_select_list(m_idx);
		
		String jsonArray = null;
		
		try {
			jsonArray = om.writeValueAsString(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	
	@RequestMapping("item_insert")
	public String item_insert() {
		return Path.ShopPath.make_path("item_insert");
	}
	
	@RequestMapping("item_insert_upload")
	public String item_insert_upload(ItemVO vo) {
		
		String webPath = "/resources/upload/shop/";
		String savePath= request.getServletContext().getRealPath(webPath);

		MultipartFile i_photo = vo.getI_photo();
		String i_photo_name = "no_file";
		
		MultipartFile i_detail_photo = vo.getI_detail_photo();
		String i_detail_photo_name = "no_file";
					
		if(!i_photo.isEmpty()) {		
			//photo.getOriginalFilename() : 업로드된 실제 파일명
			i_photo_name = i_photo.getOriginalFilename();
			i_detail_photo_name = i_detail_photo.getOriginalFilename();

			//파일을 저장할 경로 지정
			File saveFile_photo = new File(savePath, i_photo_name);
			File saveFile_detail_photo = new File(savePath, i_detail_photo_name);
			
			if(!saveFile_photo.exists()) {
				saveFile_photo.mkdirs();
				saveFile_detail_photo.mkdirs();
			} else {
				long time = System.currentTimeMillis();
				i_photo_name = String.format("%d_%s",time,i_photo_name);
				i_detail_photo_name = String.format("%d_%s",time,i_detail_photo_name);
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
		
		if(res > 0) {
			return "redirect:shop";
		} 
		
		return null;
	}
	
	@RequestMapping("shop_item_select")
	public String shop_item_select(Model model, int i_idx, String i_name) {
		
		ItemVO vo = item_dao.item_select_one(i_idx);
		List<String> colors = item_dao.item_select_color(i_name);

		model.addAttribute("vo", vo);
		model.addAttribute("colors", colors);
		
		return Path.ShopPath.make_path("shop_item");
	}
	
	@RequestMapping("select_option")
	@ResponseBody
	public String select_option (@RequestBody String body) throws UnsupportedEncodingException{
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
		
		String jsonArray = null;
		
		try {
			jsonArray = om.writeValueAsString(colors);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	
	@RequestMapping("item_count_change")
	@ResponseBody
	public String item_count_change(@RequestBody String body){
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

		if(res > 0) {
			return "{\"param\": \"yes\"}";
		} else {
			return "{\"param\": \"no\"}";
		}
	}
	
	@RequestMapping("item_delete")
	@ResponseBody
	public String item_delete(@RequestBody String body) throws UnsupportedEncodingException{
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
		
		if(res > 0) {
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
}