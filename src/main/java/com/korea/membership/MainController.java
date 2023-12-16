package com.korea.membership;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.BoardDAO;
import dao.PMemberDAO;
import dao.StoryDAO;
import util.Path;
import vo.BoardPMemberViewVO;
import vo.BoardVO;
import vo.PMemberVO;
import vo.StoryVO;

@Controller
public class MainController {

	PMemberDAO pmember_dao;
	StoryDAO story_dao;
	BoardDAO board_dao;

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	public MainController(StoryDAO story_dao, BoardDAO board_dao, PMemberDAO pmember_dao) {
		this.story_dao = story_dao;
		this.board_dao = board_dao;
		this.pmember_dao = pmember_dao;
	}

	@RequestMapping("/")
	public String home(Model model) {

		// 비로그인시 스토리 카운트 조회--------------
		int s_count = Math.min(5, story_dao.story_count());
		model.addAttribute("s_count", s_count);

		// 게시판--------------
		List<BoardPMemberViewVO> fixed_list = board_dao.fixed_board_list();
		List<BoardPMemberViewVO> unfixed_master_list = board_dao.unfixed_master_board_list();
		List<BoardVO> board_list_popular = board_dao.select_board_list_popular();

		model.addAttribute("fixed_list", fixed_list);
		model.addAttribute("unfixed_master_list", unfixed_master_list);
		model.addAttribute("board_list_popular", board_list_popular);
		
		PMemberVO membervo = (PMemberVO) session.getAttribute("id");
		if (membervo == null) {
			return Path.HomePath.make_path("home");
		}

		model.addAttribute("membervo", membervo);
		int m_idx = membervo.getM_idx();
		List<StoryVO> svo_list = story_dao.select_story_list(m_idx);

		model.addAttribute("svo_list", svo_list);

		return Path.HomePath.make_path("home");
	}

	@RequestMapping("main")
	public String main() {

		return "redirect:/";
	}
}
