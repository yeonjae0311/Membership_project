package com.korea.membership;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import dao.StoryDAO;
import util.Path;
import vo.PMemberVO;
import vo.StoryLikedVO;
import vo.StoryVO;

@Controller
public class StoryController {
	
	StoryDAO story_dao;
	
	@Autowired
	HttpServletRequest request;	
	
	@Autowired
	HttpSession session;

	public StoryController(StoryDAO story_dao) {
		this.story_dao = story_dao;
	}
	
	@RequestMapping("story")
	public String story(String s_idx,Model model) {	
		// s_idx가 String임을 주의
		PMemberVO membervo = (PMemberVO) session.getAttribute("id");
		if(membervo==null) {
			return "redirect:main";
		}
		int m_idx = membervo.getM_idx();
		/////////////////////////////////////////////////////////////////
		List<StoryVO> svo_list = story_dao.select_story_list(m_idx);
		
		model.addAttribute("svo_list",svo_list);		
		
		return Path.StoryPath.make_path("story");
	}
	
	@RequestMapping("story_post")
	public String story_post() {
		return Path.StoryPath.make_path("story_post");
	}

	@RequestMapping("story_post_insert")
	public String story_post_insert(StoryVO vo) {
		
		//여기에 vo에 속성값 더추가해줘야함
		PMemberVO uservo = (PMemberVO)session.getAttribute("id");
		vo.setM_idx(uservo.getM_idx());
		
		//이미지 업로드 코드가 필요
		String webPath = "/resources/upload/story";
		String savePath = request.getServletContext().getRealPath(webPath);
		System.out.println(savePath);
		
		MultipartFile file = vo.getS_file();
		String filename = "no_file";
		
		//파일처리
		//db에도 넣어야함
		//
		if(!file.isEmpty()) {
			filename = file.getOriginalFilename();
			
			File saveFile = new File(savePath,filename);
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			}else {
				//동일파일명 방지
				long time = System.currentTimeMillis();
				
				int pointidx = filename.indexOf(".");
				String b = filename.substring(pointidx,filename.length());
				filename = filename.substring(0,pointidx);
				
				filename = String.format("%s_%d",filename, time)+b;
				
				saveFile = new File(savePath,filename);
			}
			try {
				file.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}		
		//mapper에있는 insert 코드 추가/수정필요		
		vo.setS_filename(filename);
		int res = story_dao.story_post_insert(vo);
		if(res>0) {
			return "redirect:story";
		}		
		return null;
	}
}
