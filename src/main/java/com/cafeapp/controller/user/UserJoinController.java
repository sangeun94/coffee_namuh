package com.cafeapp.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserJoinController {

	@RequestMapping("/")
	public String login() {
		
		return "user/login"; 
			
	}

	@RequestMapping("/join")
	public String join() {
		
		return "user/join";
	}
	
}
