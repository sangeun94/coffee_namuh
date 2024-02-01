package com.cafeapp.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafeapp.common.CommonCode;
import com.cafeapp.dto.user.User;
import com.cafeapp.service.user.UserService;

@Controller
public class UserController {

    @Autowired
    private com.cafeapp.service.user.UserService userService;

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "user/join";
    }

    @PostMapping("/register")
    public String registerUser(User user) {
    	System.out.println("Registering user: " + user.toString());
    	
    	user.setIsMember(CommonCode.USER_ISMEMBER_MEMBER);
    	
        int result = userService.saveCustomerUser(user);
        System.out.println("Result from service: " + result);
       
        if (result > 0) {
            // 회원가입 성공 시 처리
            return "user/login";
        } else {
            // 회원가입 실패 시 처리
            return "redirect:/user/register";
        }
       
    }

    @GetMapping("/login")
    public String showLoginForm(Model model) {
        model.addAttribute("user", new User());
        return "user/login";
    }

    @PostMapping("/login")
    public String loginUser(User user) {
       
        User loginUser = userService.isValidCustomerLogin(user);
        if (loginUser != null) {
            // 로그인 성공 시 처리
            return "redirect:/main";
        } else {
            // 로그인 실패 시 처리
            return "redirect:/user/login?error";
        }
    }
}