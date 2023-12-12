package com.korea.membership;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.BoardDAO;
import dao.StoryDAO;
import util.Path;
import vo.PMemberVO;
import vo.StoryVO;

@Controller
public class MainController {

	StoryDAO story_dao;
	BoardDAO board_dao;
	
	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	
	public MainController(StoryDAO story_dao, BoardDAO board_dao) {
		this.story_dao = story_dao;
		this.board_dao = board_dao;
	}
	
	@RequestMapping("/")
	public String home(Model model) {
		
		PMemberVO membervo = (PMemberVO) session.getAttribute("id");
		if(membervo == null) {
			String membership = membervo.getM_ismembership();
			
			model.addAttribute("membership", membership);
			
			return Path.HomePath.make_path("home");
		}
		
		int m_idx = membervo.getM_idx();
		List<StoryVO> svo_list = story_dao.select_story_list(m_idx);

		model.addAttribute("svo_list", svo_list);
		
		String membership = membervo.getM_ismembership();
		
		model.addAttribute("membership", membership);
		
		return Path.HomePath.make_path("home");
	}

	@RequestMapping("main")
	public String main() {
		
		return "redirect:/";
	}
}
