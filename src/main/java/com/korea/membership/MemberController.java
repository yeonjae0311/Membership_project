package com.korea.membership;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.MemberDAO;

@Controller
public class MemberController {
	
	MemberDAO member_dao;

	public MemberController(MemberDAO member_dao) {
		this.member_dao = member_dao;
	}
	
	@RequestMapping(value= {"/","main.do"})
	public String main() {		
		return "/WEB-INF/views/test.jsp";
	}
}
