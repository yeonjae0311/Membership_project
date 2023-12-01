package com.korea.membership;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import util.Path;

@Controller
public class MainController {

	@RequestMapping("/")
	public String home() {		
		return Path.HomePath.make_path("home");
	}
	
	@RequestMapping("main")
	public String main() {
		return "redirect:/";
	}
}
