package com.korea.membership;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import util.Path;

@Controller
public class ShopController {
	
	@RequestMapping("shop")
	public String shop() {
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
}
