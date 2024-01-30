package com.cafeapp.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafeapp.service.users.UsersService;


@Controller
//@RequestMapping("/admin") //공통적으로 들어갈 경로
public class AdminController {

	@Autowired
	UsersService usersService;
	
	@RequestMapping("/coffee_namuh")
	public String adminMain() {
		return "admin/adminMemberList";
	}
	
}
