package com.korea.membership;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.BoardDAO;
import dao.PMemberDAO;
import util.Path;
import vo.BoardPMemberViewVO;
import vo.PMemberVO;

@Controller
public class MemberController {

	PMemberDAO pmember_dao;
	BoardDAO board_dao;

	@Autowired
	HttpSession session;

	@Autowired
	JavaMailSender mailSender;

	public MemberController(PMemberDAO pmember_dao, BoardDAO board_dao) {
		this.pmember_dao = pmember_dao;
		this.board_dao = board_dao;
	}

	@RequestMapping("login_form")
	public String login_form() {
		return Path.LoginPath.make_path("login_form");
	}

	@RequestMapping("login")
	@ResponseBody
	public String login(@RequestBody String body) {
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

		// 아이디가 없는 경우
		if (vo == null) {
			return "{\"param\": \"no_m_id\"}";
		}

		// 비밀번호가 일치하지 않는 경우
		if (!vo.getM_password().equals(m_password)) {
			return "{\"param\": \"no_m_password\"}";
		}
		
		String localStorage = null;
		
		try {
			localStorage = om.writeValueAsString(vo);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 아이디와 비밀번호 체크에 문제가 없다면 세션에 바인딩 한다.
		session.setAttribute("id", vo);

		// 로그인에 성공한 경우
		return localStorage;
	}
	
	@RequestMapping("check_email") // 이메일 중복체크
	@ResponseBody
	public String check_email(@RequestBody String body) throws UnsupportedEncodingException {
		
		ObjectMapper om = new ObjectMapper();

		Map<String, String> data = null;

		try {
			data = om.readValue(body, new TypeReference<Map<String, String>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}

		String m_email = URLDecoder.decode(data.get("m_email"), "utf-8");
		
		int res = pmember_dao.email_check(m_email);
		
		if(res == 0) {
			return "{\"param\": \"no m_email\"}";
		}
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
	public String check_id(@RequestBody String body) throws UnsupportedEncodingException {
		
		ObjectMapper om = new ObjectMapper();

		Map<String, String> data = null;

		try {
			data = om.readValue(body, new TypeReference<Map<String, String>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String m_id = URLDecoder.decode(data.get("m_id"), "utf-8");
		
		int res = pmember_dao.id_check(m_id);
		
		if (res == 0) {
			return "{\"param\": \"ok_m_id\"}";
		}

		return "{\"param\": \"fail\"}";
	}
	
	@RequestMapping("member_insert")
	public String insert_member(PMemberVO vo) {
		int res = pmember_dao.insert(vo);
		if(res>0) {
			session.setAttribute("id", vo);
			return "redirect:congratulations_register";
		}
		return null;
	}

	@RequestMapping("del")
	@ResponseBody
	public String del(int m_idx) {
		PMemberVO basevo = pmember_dao.select_one(m_idx);

		int res = pmember_dao.del_update(basevo);

		if (res == 1) {
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
	
	@RequestMapping("user_edit_profile")
	public String user_edit_profile() {
		return Path.UserPath.make_path("user_edit_profile");
	}
	
	@RequestMapping("user_order_list")
	public String user_order_list() {
		return Path.UserPath.make_path("user_order_list");
	}
	
	@RequestMapping("user_post_list")
	public String user_post_list() {
		PMemberVO vo = (PMemberVO) session.getAttribute("id");
		
		List<BoardPMemberViewVO> list = board_dao.fixed_board_list();
		
		session.setAttribute("list", list);
		
		return Path.UserPath.make_path("user_post_list");
	}
	
	@RequestMapping(value = "mail_check", method =  RequestMethod.GET )	
	@ResponseBody
	public String mailCheck(String m_email) throws Exception { // 반환값이 있기에 메서드 타입도 String

		// 인증번호 생성
		Random random = new Random();
		int check_num = random.nextInt(888888) + 111111;

		System.out.println("인증번호 :" + check_num);

		// 이메일 전송 내용
		String set_from = "chai0805123@gmail.com"; // 발신 이메일
		String to_mail = m_email; // 받는 이메일
		String title = "membership 회원가입 인증 이메일 입니다.";
		String content = "인증 번호는 " + check_num + "입니다." + "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		// 이메일 전송 코드
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(set_from);
			helper.setTo(to_mail);
			helper.setSubject(title);
			helper.setText(content, true);
			System.out.println(content);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(check_num); // ajax를 뷰로 반환시 데이터 타입은 String 타입만 가능
		return num; // String 타입으로 변환 후 반환
	}
	
	@RequestMapping("register_find_id")
	public String register_find_id() {
		return Path.LoginPath.make_path("register_find_id");
	}
	
	@RequestMapping("find_id")
	@ResponseBody
	public String find_id(@RequestBody String body) throws UnsupportedEncodingException {
		
		ObjectMapper om = new ObjectMapper();

		Map<String, String> data = null;

		try {
			data = om.readValue(body, new TypeReference<Map<String, String>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}

		String m_email = URLDecoder.decode(data.get("m_email"), "utf-8");
		String m_name = URLDecoder.decode(data.get("m_name"), "utf-8");

		PMemberVO vo = pmember_dao.id_find(m_email);

		if (vo == null) {
			return "{\"param\": \"no_m_email\"}";
		}

		if (!vo.getM_name().equals(m_name)) {
			return "{\"param\": \"no_m_name\"}";
		}

		session.setAttribute("id", vo);
		return "{\"param\": \"success\"}";
	}
	
	@RequestMapping("id")
	public String id() {
		return Path.LoginPath.make_path("id");
	}
	
	@RequestMapping("find_password")
	@ResponseBody
	public String find_password(@RequestBody String body) throws UnsupportedEncodingException {
		
		ObjectMapper om = new ObjectMapper();

		Map<String, String> data = null;

		try {
			data = om.readValue(body, new TypeReference<Map<String, String>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}

		String m_email = URLDecoder.decode(data.get("m_email"), "utf-8");
		String m_code = URLDecoder.decode(data.get("m_code"), "utf-8");
		String m_id = URLDecoder.decode(data.get("m_id"), "utf-8");
		
		HashMap<String, String> m_map = new HashMap<String, String>();
		m_map.put("m_email", m_email);
		m_map.put("m_code", m_code);
		
		System.out.println("code = " + m_code);

		PMemberVO vo = pmember_dao.id_find(m_email);
		
		if (vo == null) {
			return "{\"param\": \"no_m_email\"}";
		}

		if (!vo.getM_id().equals(m_id)) {
			return "{\"param\": \"no_m_id\"}";
		}
		
		int res = pmember_dao.password_update(m_map);
		
		session.setAttribute("id", vo);
		
		return "{\"param\": \"success\"}";
		
	}
	
	@RequestMapping("password")
	public String password() {
		return Path.LoginPath.make_path("password");
	}
	
	@RequestMapping("register_find_password")
	public String register_find_password() {
		return Path.LoginPath.make_path("register_find_password");
	}
	
	@RequestMapping("kakao_pay")
	public String kakao_pay() {
		return Path.LoginPath.make_path("kakao_pay");
	}

	@RequestMapping("user_info_modify_form")
	public String user_modify_form(Model model, int m_idx) {
		PMemberVO vo = pmember_dao.select_one(m_idx);
		model.addAttribute("vo", vo);
		return Path.UserPath.make_path("user_info_modify_form");
	}

	@RequestMapping("user_info_modify")
	public String user_modify(PMemberVO vo) {
		int res = pmember_dao.user_info_update(vo);
		PMemberVO basevo = (PMemberVO) session.getAttribute("id");
		basevo.setM_name(vo.getM_name());
		basevo.setM_tel(vo.getM_tel());
		basevo.setM_email(vo.getM_email());
		session.setAttribute("id", basevo);
		return "redirect:user_info_form";
	}
	
	@RequestMapping("photo_upload")
	public String photo_upload(PMemberVO vo, int m_idx) {
		String m_photo_name = vo.getM_photo_name();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("m_idx", m_idx);
		map.put("m_photo_name", m_photo_name);
		
		PMemberVO basevo = (PMemberVO) session.getAttribute("id");
		
		basevo.setM_photo_name(vo.getM_photo_name());
		session.setAttribute("id", basevo);
		
		return "redirect:user_edit_profile";
	}
	
	@RequestMapping("user_profile_modify")
	public String user_profile_update(PMemberVO vo) {
		int res = pmember_dao.user_profile_update(vo);
		PMemberVO basevo = (PMemberVO) session.getAttribute("id");
		basevo.setM_photo_name(vo.getM_photo_name());
		System.out.println(vo.getM_photo_name());
		basevo.setM_name(vo.getM_name());
		basevo.setM_username(vo.getM_username());
		session.setAttribute("id", basevo);
		return "redirect:user_edit";
	}
	
	@RequestMapping("congratulations_register")
	public String congratulations_register() {
		return Path.LoginPath.make_path("congratulations_register");
	}
}
