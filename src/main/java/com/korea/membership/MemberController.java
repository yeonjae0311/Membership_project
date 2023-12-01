package com.korea.membership;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.PMemberDAO;
import util.Path;
import vo.PMemberVO;

@Controller
public class MemberController {

	PMemberDAO pmember_dao;

	@Autowired
	HttpSession session;
	
	@Autowired  
	JavaMailSender mailSender;
	
	

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

	@RequestMapping("shop")
	public String shop() {
		return Path.ShopPath.make_path("shop");
	}

	@RequestMapping("login_form")
	public String login_form() {
		return Path.UserPath.make_path("login_form");
	}

	@RequestMapping("login")
	@ResponseBody
	public String login(String m_username, String m_password) {

		// id가 존재하냐 없냐에 대한 검증
		PMemberVO vo = pmember_dao.loginCheck(m_username);

		// 아이디가 없는 경우
		if (vo == null) {
			return "[{'param':'no_m_username'}]";
		}

		// 비밀번호가 일치하지 않는 경우
		if (!vo.getM_password().equals(m_password)) {
			return "[{'param':'no_m_password'}]";
		}

		// 아이디와 비밀번호 체크에 문제가 없다면 세션에 바인딩 한다.
		session.setAttribute("m_username", vo);

		// 로그인에 성공한 경우
		return "[{'param':'clear'}]";
	}

	@RequestMapping("logout")
	public String logout() {
		session.removeAttribute("m_username");

		return Path.HomePath.make_path("home");
	}

	@RequestMapping("member_insert_form")
	public String m_insert() {
		return Path.UserPath.make_path("member_insert_form");
	}

	@RequestMapping("check_id")
	@ResponseBody
	public String check_id(String m_username) {
		int res = pmember_dao.idCheck(m_username);

		if (res == 0) {
			return "[{'res':'yes'}]";
		}

		return "[{'res':'no'}]";
	}
	
	@RequestMapping(value = "mail_check", method =  RequestMethod.GET )	
	@ResponseBody
	public String mailCheck(String m_email) throws Exception{ //반환값이 있기에 메서드 타입도 String
		
		//인증번호 생성
		Random random = new Random();
		int check_num = random.nextInt(888888) + 111111;
		System.out.println("인증번호 :"+ check_num);
		
		
		//이메일 전송 내용
		String set_from = "chai0805123@gmail.com"; //발신 이메일
		String to_mail = m_email;         //받는 이메일
		String title = "membership 회원가입 인증 이메일 입니다.";
		String content = 
						"인증 번호는 " + check_num + "입니다." + 
						"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		
		//이메일 전송 코드
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(set_from);
			helper.setTo(to_mail);
			helper.setSubject(title);
			helper.setText(content,true);
			System.out.println(content);
			mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(check_num); // ajax를 뷰로 반환시 데이터 타입은 String 타입만 가능
		return num; // String 타입으로 변환 후 반환
	}
}


