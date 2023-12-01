package com.korea.membership;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import dao.CartDetailDAO;
import dao.ItemDAO;
import util.Path;
import vo.ItemVO;
import vo.PMemberVO;

@Controller
public class ShopController {
	
	@Autowired
	HttpServletRequest request;
	 
	ItemDAO item_dao;
	CartDetailDAO cart_detail_dao;

	public ShopController(ItemDAO item_dao, CartDetailDAO cart_detail_dao) {
		this.item_dao = item_dao;
		this.cart_detail_dao = cart_detail_dao;
	}
	
	@RequestMapping("shop")
	public String shop(Model model) {
		
		List<ItemVO> list = item_dao.item_list_select();
		
		model.addAttribute("list", list);
		
		return Path.ShopPath.make_path("shop");
	}
	
	@RequestMapping("shop_item")
	public String shop_item() {
		return Path.ShopPath.make_path("shop_item");
	}
	
	@RequestMapping("shopping_cart")
	public String shopping_cart(String i_name, String i_color) {
		
		HttpSession session = request.getSession();
		PMemberVO p_member_vo = (PMemberVO) session.getAttribute("m_id");
		
		// i_name과 i_color로 i_idx를 조회
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("i_name", i_name);
		map.put("i_color", i_color);
		
		int i_idx = item_dao.item_find_idx(map);
		int m_idx = p_member_vo.getM_idx();
		
		// i_idx와 m_idx를 map으로 묶어 cart_detail table에 insert 하기		
		HashMap<String, Integer> idx_map = new HashMap<String,Integer>();
		idx_map.put("i_idx", i_idx);
		idx_map.put("m_idx", m_idx);
		
		int cart = cart_detail_dao.cart_insert(idx_map);
		
		// idx로 해당 상품 정보 가져와서 바인딩
		
		
		if(cart > 0) {
			return Path.ShopPath.make_path("shopping_cart");
		} 
		
		return null;
	}
	
	@RequestMapping("item_insert")
	public String item_insert(Model model) {
		return Path.ShopPath.make_path("item_insert");
	}
	
	@RequestMapping("item_insert_upload")
	public String item_insert_upload(ItemVO vo) {
		
		String webPath = "/resources/upload/";
		String savePath= request.getServletContext().getRealPath(webPath);
		System.out.println(savePath);

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
	public String shop_item_select(int i_idx, String i_name, Model model) {
		System.out.println(i_name);
		ItemVO vo = item_dao.item_select_one(i_idx);
		List<String> colors = item_dao.item_select_color(i_name);

		model.addAttribute("vo", vo);
		model.addAttribute("colors", colors);
		
		return Path.ShopPath.make_path("shop_item");
	}
}