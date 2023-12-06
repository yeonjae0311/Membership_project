package com.korea.membership;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
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
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	@Autowired
	JavaMailSender mailSender;

	public MemberController(PMemberDAO pmember_dao, BoardDAO board_dao) {
		this.pmember_dao = pmember_dao;
		this.board_dao = board_dao;
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
			return "{\"param\": \"no m_id\"}";
		}

		// 비밀번호가 일치하지 않는 경우
		if (!vo.getM_password().equals(m_password)) {
			return "{\"param\": \"no m_password\"}";
		}

		// 아이디와 비밀번호 체크에 문제가 없다면 세션에 바인딩 한다.
		session.setAttribute("id", vo);
		session.setAttribute("m_idx", vo.getM_idx());

		// 로그인에 성공한 경우
		return "{\"param\": \"success\"}";
	}

	@RequestMapping("check_email") // 이메일 중복체크
	@ResponseBody
	public String check_email(@RequestBody String body) {

		ObjectMapper om = new ObjectMapper();

		Map<String, String> data = null;

		try {
			data = om.readValue(body, new TypeReference<Map<String, String>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}

		String m_email = data.get("m_email");

		int res = pmember_dao.email_check(m_email);

		if (res == 0) {
			return "{\"param\": \"no m_email\"}";
		}
		return "{\"param\": \"success\"}";

	}

	@RequestMapping("logout")
	public String logout() {
		session.removeAttribute("id");
		session.removeAttribute("m_idx");

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

		if (res == 0) {
			return "[{'res':'yes'}]";
		}

		return "[{'res':'no'}]";
	}

	@RequestMapping("member_insert")
	public String insert_member(PMemberVO vo) {
		int res = pmember_dao.insert(vo);
		if (res > 0) {
			session.setAttribute("id", vo);
			return "redirect:/";
		}
		return null;
	}

	@RequestMapping("delete_update")
	@ResponseBody
	public String delete_update(@RequestBody String body) {
		ObjectMapper om = new ObjectMapper();

		Map<String, String> data = null;

		try {
			data = om.readValue(body, new TypeReference<Map<String, String>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}

		int m_idx = Integer.parseInt(data.get("m_idx"));
		PMemberVO basevo = pmember_dao.select_one(m_idx);

		int res = pmember_dao.delete_update(basevo);

		System.out.println(res);

		if (res == 1) {
			return "{\"param\": \"success\"}";
		} else {
			return "{\"param\": \"fail\"}";
		}
	}

	@RequestMapping("user_edit")
	public String user_edit(HttpSession session, Model model) {
		int m_idx = (int) session.getAttribute("m_idx");

		PMemberVO vo = pmember_dao.select_one(m_idx);

		model.addAttribute("vo", vo);

		return Path.UserPath.make_path("user_edit");
	}

	@RequestMapping("user_info_form")
	public String user_info_form(HttpSession session, Model model) {
		int m_idx = (int) session.getAttribute("m_idx");

		PMemberVO vo = pmember_dao.select_one(m_idx);

		model.addAttribute("vo", vo);

		return Path.UserPath.make_path("user_info_form");
	}

	@RequestMapping("user_edit_profile")
	public String user_edit_profile(HttpSession session, Model model) {
		int m_idx = (int) session.getAttribute("m_idx");

		PMemberVO vo = pmember_dao.select_one(m_idx);

		model.addAttribute("vo", vo);

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

	@RequestMapping(value = "mail_check", method = RequestMethod.GET)
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

	@RequestMapping("register_find_password")
	public String register_find_password() {
		return Path.LoginPath.make_path("register_find_password");
	}

	@RequestMapping("register_modify_id")
	public String register_modify_id(String id) {
		int res = pmember_dao.id_update(id);

		if (res > 0) {
			return "redirect:register_modify_id";
		} else {
			System.out.println("추가 에러");
			return null;
		}
	}

	@RequestMapping("register_modify_password")
	public String register_modify_password(String password) {
		int res = pmember_dao.password_update(password);

		if (res > 0) {
			return "redirect:register_modify_password";
		} else {
			System.out.println("추가 에러");
			return null;
		}
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
	public String user_modify(PMemberVO vo, Model model) {
		int res = pmember_dao.user_info_update(vo);

		return "redirect:user_info_form";

	}

	@RequestMapping("photo_upload")
	@ResponseBody
	public String photo_upload(@RequestBody String body, Model model) {
		ObjectMapper om = new ObjectMapper();

		Map<String, String> data = null;

		try {
			data = om.readValue(body, new TypeReference<Map<String, String>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}

		int m_idx = Integer.parseInt(data.get("m_idx"));
		PMemberVO vo = pmember_dao.select_one(m_idx);
		String origin_m_photo_name = vo.getM_photo_name();

		String new_m_photo_name = data.get("new_m_photo_name");
		String m_photo_name = null;
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (!origin_m_photo_name.equals(new_m_photo_name)) {
			m_photo_name = new_m_photo_name;
			map.put("m_idx", m_idx);
			map.put("m_photo_name", m_photo_name);
		}
		int res = pmember_dao.photo_upload(map);

		model.addAttribute("map", map);

		if (res == 1) {
			return "{\"param\": \"" + m_photo_name + "\"}";
		} else {
			return "{\"param\": \"fail\"}";
		}
	}

	@RequestMapping("user_profile_modify")
	public String user_profile_update(PMemberVO vo, Model model) {
		int res = pmember_dao.user_profile_update(vo);

		return "redirect:user_edit";
	}

}