package com.korea.membership;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ItemDAO;
import util.Path;
import vo.ItemVO;

@Controller
public class ShopController {
	
	ItemDAO item_dao;

	public ShopController(ItemDAO item_dao) {
		this.item_dao = item_dao;
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
	public String shopping_cart() {
		return Path.ShopPath.make_path("shopping_cart");
	}
	
	@RequestMapping("item_insert")
	public String item_insert(Model model) {
		return Path.ShopPath.make_path("item_insert");
	}
	
	@RequestMapping("item_insert_upload")
	public String item_insert_upload(ItemVO vo) {
		
		int res = item_dao.item_upload(vo);
		
		if(res > 0) {
			return "redirect:shop";
		} 
		
		return null;
	}
	
}