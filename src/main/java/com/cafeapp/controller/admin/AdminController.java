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
@RequestMapping("/admin") //공통적으로 들어갈 경로
public class AdminController {

	@Autowired
	UsersService usersService;
	
	//고객 목록 전부 조회 -> 객체로 받아서 할때!
	//검색은 get 방식으로 해도.. 뭐 ok
	@GetMapping("/users")
	public String users(Model model, @ModelAttribute UserSearchCondition userSearchCondition) {
		
		System.out.println(userSearchCondition); //id name searchKeyword 들어가있음
		
		//고객정보 목록 가져와서
		//-> view로 전달
//			List<User> userList = userService.findCustomerUserList(); //기존 전체 목록
		
		//고객목록페이지니까 고객만 나오게끔 하기위해!
		userSearchCondition.setUserType(CommonCode.USER_USERTYPE_CUSTOMER);
		List<User> userList = userService.findUserListBySearchCondition(userSearchCondition); //검색	
		
		model.addAttribute("userList", userList);
		
		return "admin/customers";
	}
	
}
