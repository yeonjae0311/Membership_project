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

	
	@RequestMapping("login_form")
	public String login_form() {
		return Path.UserPath.make_path("login_form");
	}
	
	@RequestMapping("login_form2")
	public String login_form2() {
		return Path.UserPath.make_path("login_form_2");
	}
	
	@RequestMapping("login")
	@ResponseBody
	public String login(String m_username, String m_password) {
		
		//id가 존재하냐 없냐에 대한 검증
		PMemberVO vo = pmember_dao.loginCheck(m_username);
		
		//아이디가 없는 경우
		if(vo == null) {
			return "[{'param':'no_m_username'}]";
		}
		
		//비밀번호가 일치하지 않는 경우
		if(!vo.getM_password().equals(m_password)) {
			return "[{'param':'no_m_password'}]";
		}
		
		//아이디와 비밀번호 체크에 문제가 없다면 세션에 바인딩 한다.
		session.setAttribute("m_id", vo);
		
		//로그인에 성공한 경우
		return "[{'param':'clear'}]";
	}
	
	@RequestMapping("login2")
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
		
		String m_username = data.get("m_username");
		String m_password = data.get("m_password");
		
		PMemberVO vo = pmember_dao.loginCheck(m_username);
		
		//아이디가 없는 경우
		if(vo == null) {
			return "{\"param\": \"no m_username\"}";
		}
		
		//비밀번호가 일치하지 않는 경우
		if(!vo.getM_password().equals(m_password)) {
			return "{\"param\": \"no m_password\"}";
		}
		
		//아이디와 비밀번호 체크에 문제가 없다면 세션에 바인딩 한다.
		session.setAttribute("m_id", vo);
		
		//로그인에 성공한 경우
		return "{\"param\": \"success\"}";
	}
	
	@RequestMapping("logout")
	public String logout() {
		session.removeAttribute("m_id");
		
		return Path.HomePath.make_path("home");
	}
	
	@RequestMapping("member_insert_form")
	public String m_insert() {
		return Path.UserPath.make_path("member_insert_form");
	}
	
	@RequestMapping("check_id")
	@ResponseBody
	public String check_id(String id) {
		int res = pmember_dao.idCheck(id);
		
		if(res == 0) {
			return "[{'res':'yes'}]";
		}
		
		return "[{'res':'no'}]";
	}
	
	@RequestMapping("del")
	@ResponseBody
	public String delete(int idx) {
		PMemberVO basevo = pmember_dao.selectone(idx);
		
		int res = pmember_dao.del_update(basevo);
		
		if(res == 1) {
			return "[{'result':'yes']}";
		} else {
			return "[{'result':'no'}]";
		}
		
	}
	
}
