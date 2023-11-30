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
		
		//전체 공지사항글 조회
		List<BoardVO> list1 = board_dao.select_board_list("1");
		model.addAttribute("list1",list1);
		
		//(공지사항제외) 전체 글 조회
		List<BoardVO> list2 = board_dao.select_board_list("0");
		model.addAttribute("list2",list2);
		
		return Path.BoardPath.make_path("board");
	}
	
}
