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

import dao.ReplyDAO;
import vo.PMemberVO;

@Controller
public class ReplyController {
	
	ReplyDAO reply_dao;

	@Autowired
	HttpServletRequest request;	
	
	@Autowired
	HttpSession session;
	
	public ReplyController(ReplyDAO reply_dao) {
		this.reply_dao = reply_dao;
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
}
