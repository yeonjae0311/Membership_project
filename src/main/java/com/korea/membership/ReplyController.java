package com.korea.membership;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.BoardDAO;
import dao.ReplyDAO;
import util.Path;
import vo.BoardVO;
import vo.PMemberVO;
import vo.ReplyVO;

@Controller
public class ReplyController {
	
	ReplyDAO reply_dao;
	BoardDAO board_dao;

	@Autowired
	HttpServletRequest request;	
	
	@Autowired
	HttpSession session;
	
	public ReplyController(ReplyDAO reply_dao,BoardDAO board_dao) {
		this.reply_dao = reply_dao;
		this.board_dao = board_dao;
	}
	
	@RequestMapping("add_reply_like")
	@ResponseBody
	public String add_reply_like(@RequestBody String body) throws UnsupportedEncodingException{
		ObjectMapper om = new ObjectMapper();

	    Map<String, String> data = null;
	    
	    try {
	    	data = om.readValue(body, new TypeReference<Map<String, String>>() {});
        } catch (Exception e) {
            e.printStackTrace();
        }

	    int r_idx = Integer.parseInt(data.get("r_idx"));
	    PMemberVO uservo = (PMemberVO)session.getAttribute("id");
	    if(uservo==null) {
			return "{\"res\": \"fail\"}";	
	    }
	    int m_idx = uservo.getM_idx();
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    map.put("r_idx", r_idx);
	    map.put("m_idx", m_idx);
	    
	    int res = reply_dao.add_reply_like(map);
	    if(res>0) {
	    	reply_dao.update_reply_like_count(r_idx);
	    	return "{\"res\": \"plus\",\"r_idx\":\""+r_idx+"\"}";	
		}else {
			return "{\"res\": \"fail\"}";	
		}
	}
	
	@RequestMapping("delete_reply_to_unlike")
	@ResponseBody
	public String delete_reply_to_unlike(@RequestBody String body) throws UnsupportedEncodingException{
		ObjectMapper om = new ObjectMapper();

	    Map<String, String> data = null;
	    
	    try {
	    	data = om.readValue(body, new TypeReference<Map<String, String>>() {});
        } catch (Exception e) {
            e.printStackTrace();
        }

	    int r_idx = Integer.parseInt(data.get("r_idx"));
	    PMemberVO uservo = (PMemberVO)session.getAttribute("id");
	    if(uservo==null) {
			return "{\"res\": \"fail\"}";	
	    }
	    int m_idx = uservo.getM_idx();
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    map.put("r_idx", r_idx);
	    map.put("m_idx", m_idx);
	    
	    int res = reply_dao.delete_reply_to_unlike(map);
	    
	    if(res>0) {
	    	reply_dao.update_reply_like_count(r_idx);
	    	return "{\"res\": \"minus\",\"r_idx\":\""+r_idx+"\"}";			
		}else {
			return "{\"res\": \"fail\"}";	
		}
	}
	
	@RequestMapping("delete_reply")
	@ResponseBody
	public String after_delete_reply(@RequestBody String body) throws UnsupportedEncodingException{
		ObjectMapper om = new ObjectMapper();

	    Map<String, String> data = null;
	    
	    try {
	    	data = om.readValue(body, new TypeReference<Map<String, String>>() {});
        } catch (Exception e) {
            e.printStackTrace();
        }

	    int r_idx = Integer.parseInt(data.get("r_idx"));
	    PMemberVO uservo = (PMemberVO)session.getAttribute("id");

    	//로그인 되어있지 않으면 fail 반환
	    if(uservo==null) {
			return "{\"res\": \"fail\"}";	
	    }
	    
	    int m_idx = uservo.getM_idx();
	    
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    map.put("r_idx", r_idx);
	    map.put("m_idx", m_idx);
	    
	    //댓글의 작성자가 본인인지 확인하는 코드 (본인일시 삭제후 1리턴)
	    int res = reply_dao.delete_reply_by_writer(map);
	    
	    if(res>0) {
	    	return "{\"res\": \"success\",\"r_idx\":\""+r_idx+"\"}";	
		}
	    
	    int ismaster = board_dao.is_master(m_idx);
	    if(ismaster==1) {
	    	int res2 = reply_dao.delete_reply_by_master(r_idx);
	    	if(res2>0) {
		    	return "{\"res\": \"success\",\"r_idx\":\""+r_idx+"\"}";
	    	}
	    }
	    
		return "{\"res\": \"fail\"}";
	}
	
	@RequestMapping("check_edit_reply")
	@ResponseBody
	public String check_edit_reply(@RequestBody String body) {
		
		ObjectMapper om = new ObjectMapper();

	    Map<String, String> data = null;
	    
	    try {
	    	data = om.readValue(body, new TypeReference<Map<String, String>>() {});
        } catch (Exception e) {
            e.printStackTrace();
        }

	    int r_idx = Integer.parseInt(data.get("r_idx"));
	    
	    PMemberVO uservo = (PMemberVO)session.getAttribute("id");
	    if(uservo==null) {
			return "{\"res\": \"fail\"}";	
	    }
	    
	    int m_idx = uservo.getM_idx();
	    
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    map.put("r_idx", r_idx);
	    map.put("m_idx", m_idx);
	    
	    int res = reply_dao.select_one_reply(map);
	    if(res>0) {
	    	return "{\"res\": \"success\",\"r_idx\":\""+r_idx+"\"}";	
		}else {
			return "{\"res\": \"fail\"}";	
		}
	}
	
	@RequestMapping("update_reply")
	public String update_reply(ReplyVO vo) {
		System.out.println(vo);
		vo.setR_ip(request.getRemoteAddr());
		
		int res = reply_dao.update_reply(vo);
		if(res>0) {
			
		}
		
		int b_idx= vo.getB_idx();
		
		return "redirect:board_view?b_idx="+b_idx;
	}
}
