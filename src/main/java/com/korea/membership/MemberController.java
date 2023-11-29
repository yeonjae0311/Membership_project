package com.korea.membership;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.PMemberDAO;
import util.Path;

@Controller
public class MemberController {
	
	PMemberDAO pmember_dao;

	public MemberController(PMemberDAO pmember_dao) {
		this.pmember_dao = pmember_dao;
	}
	
	@RequestMapping("/")
	public String home() {		
		return Path.HomePath.make_path("home");
	}
	
	@RequestMapping("/main")
	public String main() {
		return "redirect:/";
	}
	
	@RequestMapping("story")
	public String story() {
		return Path.StoryPath.make_path("story");
	}
	
	@RequestMapping("board")
	public String board() {
		return Path.BoardPath.make_path("board");
	}
}
