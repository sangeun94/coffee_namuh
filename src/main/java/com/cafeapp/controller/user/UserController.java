package com.cafeapp.controller.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.cafeapp.common.CommonCode;
import com.cafeapp.dto.user.User;
import com.cafeapp.service.user.UserService;
import com.cafeapp.util.LoginManager;

@Controller
public class UserController {

    @Autowired
    UserService userService;
    
    @Autowired
	LoginManager loginManager;

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
    public String loginUser(User user, HttpServletResponse response, HttpSession session) {
    	System.out.println(user);
        User loginUser = userService.isValidCustomerLogin(user);

        System.out.println(loginUser);
        if (loginUser != null) {
            // 로그인 성공 시 처리
        	loginManager.setSessionLogin(loginUser.getUserId(), session);
            //sessionManager.createSession(loginUser, response);
            
            return "redirect:/main";
        } else {
            // 로그인 실패 시 처리
            return "redirect:/login";
        }
    }

    @GetMapping("/main")
    public String showMainPage(HttpServletRequest request, Model model) {
      
        return "user/main";
    }
    
    @PostMapping("/login-api")
    @ResponseBody
    public Map<String, Object> loginUserApi(@RequestParam String userId, @RequestParam String userPassword) {
        Map<String, Object> response = new HashMap<>();

        User user = new User();
        user.setUserId(userId);
        user.setUserPassword(userPassword);

        User loginUser = userService.isValidCustomerLogin(user);

        if (loginUser != null) {
            // 로그인 성공 시 처리
            response.put("resultCode", 200);
            response.put("msg", "로그인 성공");
            // 로그인 실패 시 처리
            response.put("resultCode", 400);
            response.put("msg", "아이디와 비밀번호를 확인해주세요.");
        }

        return response;
    }
    
    @PostMapping("/customer/isDuplicatedId")
    @ResponseBody
    public Map<String, Object> isDuplicatedId(@RequestParam String id) {
        Map<String, Object> response = new HashMap<>();

        try {
            boolean isDuplicated = userService.isDuplicatedId(id);

            if (isDuplicated) {
                response.put("resultCode", 409);
                response.put("msg", "아이디가 중복됩니다.");
            } else {
                response.put("resultCode", 200);
                response.put("msg", "사용 가능한 아이디입니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.put("resultCode", 500);
            response.put("msg", "서버 오류가 발생했습니다.");
        }

        return response;
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	loginManager.logout(session);
    	
        return "redirect:/login";
    }
    
    
    @RequestMapping("/main")
    public String main() {
    	return"user/main";
    }
    
    @RequestMapping("/adminLogin")
    public String adminPage() {
    	return"admin/adminLogin";
    }
    
  //adminLogin
    
    @GetMapping("/admin")
    public String showAdminLoginForm(Model model) {
        model.addAttribute("user", new User());
        
        return "/adminLogin";
    }

    @PostMapping("/admin/adminLogin")
    public String loginAdminUser(User user, HttpServletResponse response ,HttpSession session) {
        User adminLoginUser = userService.isValidAdminLogin(user);
        
        System.out.println(adminLoginUser);
        
        System.out.println(adminLoginUser);
        if (adminLoginUser != null) {
            // 로그인 성공 시 처리
        	loginManager.setSessionLogin(adminLoginUser.getUserId(), session);
            return "redirect:/admin/adminMember";
        } else {
            // 로그인 실패 시 처리
        	return "redirect:/adminlogin";
        }
        
    }

    @GetMapping("/admin/main")
    public String showAdminMainPage(HttpServletRequest request, Model model) {
     
        return "admin/main";
    }

    
    
    @GetMapping("/admin/logout")
    public String logoutAdmin(HttpServletRequest request, HttpServletResponse response, Model model) {
        

        return "redirect:/adminLogin";
    }
    
    

    @GetMapping("/mypage")
    public String showMyPage( Model model, HttpSession session) {
    	loginManager.isLogin(session);
    	String userId = loginManager.getUserId(session);
    	 
    	        User user = userService.findUserById(userId);
    	 
    	        if (user != null) {
    	            model.addAttribute("user", user); 
    	        }
    	   
    	        
       
        return "user/mypage";
    }

    
    

    
}
