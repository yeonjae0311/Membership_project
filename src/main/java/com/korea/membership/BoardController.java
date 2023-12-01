package com.korea.membership;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.BoardDAO;
import util.Path;
import vo.BoardPMemberViewVO;

@Controller
public class BoardController {
	
	BoardDAO board_dao;
	
	@Autowired
	HttpServletRequest request;	
	
	@Autowired
	HttpSession session;

	public BoardController(BoardDAO board_dao) {
		this.board_dao = board_dao;
	}
	
	@RequestMapping("board")
	public String board(Model model) {

		List<BoardPMemberViewVO> fixed_list =  board_dao.select_fixed_list();
		List<BoardPMemberViewVO> unfixed_master_list =  board_dao.select_fixed_list();
		List<BoardPMemberViewVO> unfixed_fan_list =  board_dao.select_fixed_list();
				
		
		model.addAttribute("fixed_list",fixed_list);
		model.addAttribute("unfixed_master_list",unfixed_master_list);
		model.addAttribute("unfixed_fan_list",unfixed_fan_list);
		
		return Path.BoardPath.make_path("board");
	}
	
}
