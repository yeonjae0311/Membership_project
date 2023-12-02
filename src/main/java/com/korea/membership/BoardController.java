package com.korea.membership;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardDAO;
import util.Path;
import vo.BoardPMemberViewVO;
import vo.BoardVO;
import vo.PMemberVO;

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

		List<BoardPMemberViewVO> fixed_list =  board_dao.fixed_board_list();
		List<BoardPMemberViewVO> unfixed_master_list =  board_dao.unfixed_master_board_list();
		List<BoardPMemberViewVO> unfixed_fan_list =  board_dao.unfixed_all_board_list();
				
		
		model.addAttribute("fixed_list",fixed_list);
		model.addAttribute("unfixed_master_list",unfixed_master_list);
		model.addAttribute("unfixed_fan_list",unfixed_fan_list);
		
		return Path.BoardPath.make_path("board");
	}
	
	@RequestMapping("board_post")
	public String board_post() {
		System.out.println("board_post진입");
		return Path.BoardPath.make_path("board_post");
	}
	
	@RequestMapping("board_post_insert")
	public String board_post_insert(BoardVO vo) {
		vo.setB_ip(request.getRemoteAddr());
		String webPath = "/resources/upload";
		String savePath = request.getServletContext().getRealPath(webPath);
		System.out.println(savePath);
		PMemberVO Logined_vo = (PMemberVO)session.getAttribute("id");
		vo.setM_idx(Logined_vo.getM_idx());
		vo.setB_isfixed("0");
		
		System.out.println(vo);
		MultipartFile file = vo.getB_file();
		String filename = "no_file";
		
		//파일처리
		//db에도 넣어야함
		//
		if(!file.isEmpty()) {
			filename = file.getOriginalFilename();
			
			File saveFile = new File(savePath,filename);
			if(!saveFile.exists()) {
				System.out.println("1");
				saveFile.mkdirs();
				System.out.println("2");
			}else {
				System.out.println("3");
				//동일파일명 방지
				long time = System.currentTimeMillis();
				
				int pointidx = filename.indexOf(".");
				String b = filename.substring(pointidx,filename.length());
				filename = filename.substring(0,pointidx);
				
				filename = String.format("%s_%d",filename, time)+b;
				
				saveFile = new File(savePath,filename);
				System.out.println("4");
			}
			try {
				file.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("check");
		vo.setB_filename(filename);
		
		int res = board_dao.board_insert(vo);
		
		if(res>0) {
			return "redirect:board";
		}else {
			System.out.println("추가 실패 에러");
			return null;
		}		
	}
	
	@RequestMapping("board_view")
	public String board_view(Model model,int b_idx) {
		//게시물 한건 조회
		BoardPMemberViewVO vo = board_dao.board_selectOne(b_idx);
		
		model.addAttribute("vo",vo);
		
		return Path.BoardPath.make_path("board_view");
	}
	
}
