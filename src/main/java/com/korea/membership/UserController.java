package com.korea.membership;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import util.Path;

@Controller
public class UserController {
	
	@RequestMapping("user_edit")
	public String user_edit() {		
		return Path.UserPath.make_path("user_edit");
	}
}
