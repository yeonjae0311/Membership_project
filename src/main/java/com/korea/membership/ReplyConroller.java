package com.korea.membership;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ReplyDAO;
import vo.PMemberVO;
import vo.ReplyVO;

@Controller
public class ReplyConroller {
	
	ReplyDAO reply_dao;

	@Autowired
	HttpServletRequest request;	
	
	@Autowired
	HttpSession session;
	
	public ReplyConroller(ReplyDAO reply_dao) {
		this.reply_dao = reply_dao;
	}
	
}
