package com.korea.membership;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import dao.ReplyDAO;

@Controller
public class ReplyController {
	
	ReplyDAO reply_dao;

	@Autowired
	HttpServletRequest request;	
	
	@Autowired
	HttpSession session;
	
	public ReplyController(ReplyDAO reply_dao) {
		this.reply_dao = reply_dao;
	}
}
