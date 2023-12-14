package com.korea.membership;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.BoardDAO;
import dao.ReplyDAO;
import util.Common;
import util.Page;
import util.Path;
import vo.BoardPMemberReplyViewVO;
import vo.BoardPMemberViewVO;
import vo.BoardVO;
import vo.PMemberVO;
import vo.ReplyVO;

@Controller
public class BoardController {
	
	BoardDAO board_dao;
	ReplyDAO reply_dao;
	
	@Autowired
	HttpServletRequest request;	
	
	@Autowired
	HttpSession session;

	public BoardController(BoardDAO board_dao,ReplyDAO reply_dao) {
		this.board_dao = board_dao;
		this.reply_dao = reply_dao;
	}
	
	@RequestMapping("board")
	public String board(Model model,String page1,String page2) {
		session.removeAttribute("board_post_viewed");
		
		int nowPage1,nowPage2;
		
		nowPage1=nowPage2= 1;
		
		if(page1!=null && !page1.isEmpty()) {
			nowPage1 = Integer.parseInt(page1);
		}
		
		if(page2!=null && !page2.isEmpty()) {
			nowPage2 = Integer.parseInt(page2);
		}
	
		int count_unfixed_master_list = board_dao.count_unfixed_master_list();
		int count_unfixed_fan_list = board_dao.count_unfixed_fan_list();

		int start1 = (nowPage1-1)*Common.BOARD_PER_PAGE+1;
		int end1 = start1+Common.BOARD_PER_PAGE-1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start1", start1);
		map.put("end1", end1);
		
		
		
		int start2 = (nowPage2-1)*Common.BOARD_PER_PAGE+1;
		int end2 = start2+Common.BOARD_PER_PAGE-1;		
		
		map.put("start2", start2);
		map.put("end2", end2);		
		
		String pageMenu1 = Page.getPaging("board",
				nowPage1, 
				count_unfixed_master_list, 
				Common.BOARD_PER_PAGE, 
				Common.BLOCKPAGE);
		
		String pageMenu2 = Page.getPaging2("board",
				nowPage2, 
				count_unfixed_fan_list, 
				Common.BOARD_PER_PAGE, 
				Common.BLOCKPAGE);
		
		List<BoardPMemberViewVO> fixed_list =  board_dao.fixed_board_list();
		List<BoardPMemberViewVO> unfixed_master_list =  board_dao.unfixed_master_board_list(map);
		List<BoardPMemberViewVO> unfixed_fan_list =  board_dao.unfixed_all_board_list(map);
				
		model.addAttribute("pageMenu1",pageMenu1);
		model.addAttribute("pageMenu2",pageMenu2);
		model.addAttribute("fixed_list",fixed_list);
		model.addAttribute("unfixed_master_list",unfixed_master_list);
		model.addAttribute("unfixed_fan_list",unfixed_fan_list);
		int priority;
		if(nowPage1==1) {
			priority=2; 
		}else if(nowPage2==1) {
			priority=1;
		}else {
			priority=1;
			System.out.println("예외 발생 priority : "+priority);
			System.out.println("nowPage1 : "+nowPage1);
			System.out.println("nowPage2 : "+nowPage2);
		}
		model.addAttribute("priority",priority);
		
		return Path.BoardPath.make_path("board");
	}
	
	@RequestMapping("board_post")
	public String board_post() {
		return Path.BoardPath.make_path("board_post");
	}
	
	@RequestMapping("board_post_insert")
	public String board_post_insert(BoardVO vo) {
		
		PMemberVO user_vo = (PMemberVO) session.getAttribute("id");
		int m_idx = user_vo.getM_idx();
		int is_master = board_dao.is_master(m_idx);
		if(is_master==0) {
			return "redirect:logout";
		}
		
		vo.setB_ip(request.getRemoteAddr());
		
		String webPath = "/resources/upload/board";
		String savePath = request.getServletContext().getRealPath(webPath);
		
		PMemberVO Logined_vo = (PMemberVO)session.getAttribute("id");
		vo.setM_idx(Logined_vo.getM_idx());
		
		MultipartFile file = vo.getB_file();
		String filename = "no_file";
		
		System.out.println("here");
		
		System.out.println(file.isEmpty());
		
		//파일처리
		if(!file.isEmpty() || file == null) {
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
		
		vo.setB_filename(filename);
		int res = board_dao.board_insert(vo);
		if(res>0) {
			return "redirect:board";
		}else {
			return null;
		}		
	}
	
	@RequestMapping("board_reply")
	public String board_reply(ReplyVO vo) {
		
		vo.setR_ip(request.getRemoteAddr());
		
		PMemberVO pm_vo=(PMemberVO)session.getAttribute("id");
		vo.setM_idx(pm_vo.getM_idx());
		
		int res = reply_dao.insert_reply(vo);
		
		if(res>0) {
			return "redirect:board_view?b_idx="+vo.getB_idx();
		}		
		
		return null;
	}
	
	@RequestMapping("board_view")
	public String board_view(Model model,int b_idx) {		//게시물 한건 조회
		
		
		//해당 게시물 좋아요 했는지를 조회하기 위한 매개변수 map 세팅
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("b_idx", b_idx);
		
		PMemberVO uservo = (PMemberVO) session.getAttribute("id");
		if(uservo==null) {
			return Path.HomePath.make_path("login_check");
		}
		
		map.put("m_idx", uservo.getM_idx());
		
		BoardPMemberViewVO vo = board_dao.board_select_one(map);
		
		//최근에 본 것 (세션으로부터) 조회
		String board_post_viewed = (String)session.getAttribute("board_post_viewed");
		
		//조회수 증가
		if(vo!=null && (board_post_viewed==null || !board_post_viewed.equals(b_idx+""))) {			
			board_dao.plus_board_read_hit(b_idx);
			session.setAttribute("board_post_viewed", b_idx+"");
		}
		
		model.addAttribute("vo",vo);
			
		List<BoardPMemberReplyViewVO> reply_list = reply_dao.select_reply_list(map);
		
		model.addAttribute("reply_list",reply_list);
		
		return Path.BoardPath.make_path("board_view");
	}
	
	@RequestMapping("delete_board_post")
	@ResponseBody
	public String delete_board_post(@RequestBody String body) throws UnsupportedEncodingException{
		ObjectMapper om = new ObjectMapper();

	    Map<String, String> data = null;
	    
	    try {
	    	data = om.readValue(body, new TypeReference<Map<String, String>>() {});
        } catch (Exception e) {
            e.printStackTrace();
        }
	    
	    int m_idx = Integer.parseInt(data.get("m_idx"));
	    int b_idx = Integer.parseInt(data.get("b_idx"));
	        
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m_idx", m_idx);
		map.put("b_idx", b_idx);
		String result = null;
		
		boolean is_need_to_delete_replys = false;
		int res = board_dao.delete_board_post(map);
		
		if(res>0) {//작성자 본인이면 삭제
			is_need_to_delete_replys = true;
			result = "delete_by_user";
			//삭제가 됐다면 reply도 삭제
		}else {
			//작성자는 아니지만 마스터라면 삭제할수 있어야함
			int ismaster = board_dao.is_master(m_idx);
			if(ismaster == 1)
			{
				int res2 = board_dao.delete_board_post_by_master(b_idx);
				if(res2>0) {
					is_need_to_delete_replys = true;
					result = "delete_by_master";
				}
			}
		}
		if(is_need_to_delete_replys) {
			reply_dao.delete_replys_by_b_idx(b_idx);
		}
		
		if(result!=null) {
			return "{\"res\": \"success\"}";			
		}else {
			return "{\"res\": \"fail\"}";	
		}
	}
	
	@RequestMapping("add_board_like")
	@ResponseBody
	public String add_board_like(@RequestBody String body) throws UnsupportedEncodingException{
		ObjectMapper om = new ObjectMapper();

        Map<String, String> data = null;

        try {
            data = om.readValue(body, new TypeReference<Map<String, String>>() { });
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        String b_idx_str = URLDecoder.decode(data.get("b_idx"), "utf-8");
        int b_idx = Integer.parseInt(b_idx_str);
        
        PMemberVO uservo = (PMemberVO)session.getAttribute("id");
        if(uservo==null) {
            return "{\"param\": \"fail\",\"b_idx\":\""+b_idx+"\"}";
        }
        
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("b_idx", b_idx);
        map.put("m_idx", uservo.getM_idx());
        
        int res = board_dao.add_board_like(map);
        
        if(res>0) {
        	board_dao.recalculate_total_like(b_idx);
            return "{\"param\": \"plus\",\"b_idx\":\""+b_idx+"\"}";
        }else {
            return "{\"param\": \"fail\",\"b_idx\":\""+b_idx+"\"}";
        }
	}
	
	@RequestMapping("delete_board_to_unlike")
	@ResponseBody
	public String delete_to_unlike(@RequestBody String body) throws UnsupportedEncodingException{
		ObjectMapper om = new ObjectMapper();

        Map<String, String> data = null;

        try {
            data = om.readValue(body, new TypeReference<Map<String, String>>() { });
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        String b_idx_str = URLDecoder.decode(data.get("b_idx"), "utf-8");
        int b_idx = Integer.parseInt(b_idx_str);
        
        PMemberVO uservo = (PMemberVO)session.getAttribute("id");
        if(uservo==null) {
            return "{\"param\": \"fail\",\"b_idx\":\""+b_idx+"\"}";
        }
        
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("b_idx", b_idx);
        map.put("m_idx", uservo.getM_idx());
        
        int res = board_dao.delete_to_unlike(map);
        
        if(res>0) {
        	board_dao.recalculate_total_like(b_idx);
            return "{\"param\": \"minus\",\"b_idx\":\""+b_idx+"\"}";
        }else {
            return "{\"param\": \"fail\",\"b_idx\":\""+b_idx+"\"}";
        }
	}
}
