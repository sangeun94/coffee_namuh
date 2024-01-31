package com.cafeapp.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafeapp.common.CommonCode;
import com.cafeapp.dto.user.User;
import com.cafeapp.dto.user.UserSearchCondition;
import com.cafeapp.service.user.UserService;


@Controller
//@RequestMapping("/admin") //공통적으로 들어갈 경로
public class AdminController {

	@Autowired
	UserService userService;
	
	//회원정보 목록 및 검색
	@RequestMapping("/adminMember")
	public String adminMain(Model model, @ModelAttribute UserSearchCondition userSearchCondition) {
		
		System.out.println(userSearchCondition);
		
		//회원목록페이지 -> 회원, 탈퇴한 회원만 나오게! => mapper에서 설정!
	    
		List<User> userList = userService.findMemberListBySearchCondition(userSearchCondition); //검색	
		
		model.addAttribute("userList", userList);
	    model.addAttribute("totalUsers", userList.size()); // 회원 수를 모델에 추가

		return "admin/adminMemberList";
	}
	
	//회원정보수정
	@GetMapping("/modifyMember")
	public String modifyMember(@RequestParam String userNumber, Model model) {
		
		int intUserNumber = Integer.parseInt(userNumber);
		//userNumber가 int인데 혹시나 파라미터로 String이 넘어올수도 있으니까 그 오류가 안나오게 하기위해!
				
		User user = userService.findMemberByUserNumber(intUserNumber); //위에서 string으로 받아버렸으니까 원래상태인 int로 변환!
		
		System.out.println(user);
		
		model.addAttribute("user", user);
		
		return "admin/adminMemberModify";
	}
	
	@PostMapping("/modifyMember")
	public String modifyMemberProcess(User user) { //파라미터는 user객체!
		System.out.println(user);
			
		int result = userService.modifyMember(user);
		
		if (result > 0) { //저장 성공
			return "redirect:/admin/adminMemberList"; //수정성공: 회원목록페이지
		} else { //저장 실패
			return "admin/adminMemberModify"; //수정실패: 회원정보 수정페이지 
		}
		
	}
	
}
