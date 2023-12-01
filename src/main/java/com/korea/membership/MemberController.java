package com.korea.membership;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.PMemberDAO;
import util.Path;
import vo.PMemberVO;

@Controller
public class MemberController {
	
	PMemberDAO pmember_dao;
	
	@Autowired
	HttpSession session;

	public MemberController(PMemberDAO pmember_dao) {
		this.pmember_dao = pmember_dao;
	}
	
	@RequestMapping("story")
	public String story() {
		return Path.StoryPath.make_path("story");
	}

	
	@RequestMapping("login_form")
	public String login_form() {
		return Path.LoginPath.make_path("login_form");
	}
	
	@RequestMapping("login")
	@ResponseBody
	public String login2(@RequestBody String body) {
		ObjectMapper om = new ObjectMapper();
		
		Map<String, String> data = null;
		
		try {
			data = om.readValue(body, new TypeReference<Map<String, String>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String m_id = data.get("m_id");
		String m_password = data.get("m_password");
		
		PMemberVO vo = pmember_dao.login_check(m_id);
		
		//아이디가 없는 경우
		if(vo == null) {
			return "{\"param\": \"no m_id\"}";
		}
		
		//비밀번호가 일치하지 않는 경우
		if(!vo.getM_password().equals(m_password)) {
			return "{\"param\": \"no m_password\"}";
		}
		
		//아이디와 비밀번호 체크에 문제가 없다면 세션에 바인딩 한다.
		session.setAttribute("id", vo);
		
		//로그인에 성공한 경우
		return "{\"param\": \"success\"}";
	}
	
	@RequestMapping("logout")
	public String logout() {
		session.removeAttribute("id");
		
		return Path.HomePath.make_path("home");
	}
	
	@RequestMapping("member_insert_form")
	public String member_insert_form() {
		return Path.UserPath.make_path("member_insert_form");
	}
	
	@RequestMapping("check_id")
	@ResponseBody
	public String check_id(String m_id) {
		int res = pmember_dao.id_check(m_id);
		
		if(res == 0) {
			return "[{'res':'yes'}]";
		}
		
		return "[{'res':'no'}]";
	}
	
	@RequestMapping("del")
	@ResponseBody
	public String del(int idx) {
		PMemberVO basevo = pmember_dao.select_one(idx);
		
		int res = pmember_dao.del_update(basevo);
		
		if(res == 1) {
			return "[{'result':'yes']}";
		} else {
			return "[{'result':'no'}]";
		}
	}
	
	@RequestMapping("user_edit")
	public String user_edit() {		
		return Path.UserPath.make_path("user_edit");
	}
	
	@RequestMapping("user_info_form")
	public String user_info_form() {
		return Path.UserPath.make_path("user_info_form");
	}
	
}
