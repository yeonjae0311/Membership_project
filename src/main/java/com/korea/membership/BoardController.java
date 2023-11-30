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
import vo.BoardVO;

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
	public String board(Model model,String b_isfixed) {
		
		if(b_isfixed == null || b_isfixed.isEmpty()) {
			b_isfixed="0";
		}
		List<BoardVO> list = board_dao.select_list_normal_user(b_isfixed);
		model.addAttribute("list2",list);
		
		return Path.BoardPath.make_path("board");
	}
	
}
