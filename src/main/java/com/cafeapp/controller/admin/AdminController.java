package com.cafeapp.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafeapp.common.CommonCode;
import com.cafeapp.dto.user.User;
import com.cafeapp.dto.user.UserSearchCondition;
import com.cafeapp.service.user.UserService;


@Controller
//@RequestMapping("/admin") //공통적으로 들어갈 경로
public class AdminController {

	@Autowired
	UserService userService;
	
	@RequestMapping("/adminMember")
	public String adminMain(Model model, @ModelAttribute UserSearchCondition userSearchCondition) {
		
		System.out.println(userSearchCondition);
		
		//회원목록페이지 -> 회원, 탈퇴한 회원만 나오게! => mapper에서 설정!

	    
		List<User> userList = userService.findMemberListBySearchCondition(userSearchCondition); //검색	
		
		model.addAttribute("userList", userList);
	    model.addAttribute("totalUsers", userList.size()); // 회원 수를 모델에 추가

		return "admin/adminMemberList";
	}
	
}
