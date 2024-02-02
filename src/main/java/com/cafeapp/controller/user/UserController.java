package com.cafeapp.controller.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.cafeapp.common.CommonCode;
import com.cafeapp.dto.user.User;
import com.cafeapp.service.user.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private SessionManager sessionManager;

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
    public String loginUser(User user, HttpServletResponse response) {
    	System.out.println(user);
        User loginUser = userService.isValidCustomerLogin(user);

        System.out.println(loginUser);
        if (loginUser != null) {
            // 로그인 성공 시 처리
            sessionManager.createSession(loginUser, response);
            return "redirect:/main";
        } else {
            // 로그인 실패 시 처리
            return "redirect:/login";
        }
    }

    @GetMapping("/main")
    public String showMainPage(HttpServletRequest request, Model model) {
        User loginUser = (User) sessionManager.getSession(request);

        
        
        if (loginUser == null) {
            // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
            return "redirect:/login";
        }

       

        // 로그인 성공 시 메인 페이지로 이동
        model.addAttribute("loginUser", loginUser);
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
    public String logout(HttpServletRequest request, HttpServletResponse response, Model model) {
        sessionManager.expire(request); // 세션 만료 처리
        Cookie cookie = new Cookie(SessionManager.SESSION_COOKIE_NAME, null);
        cookie.setMaxAge(0); // 쿠키 삭제
        response.addCookie(cookie);

        
        model.addAttribute("sessionExpired", true);

        return "redirect:/login";
    }
    
    
    @RequestMapping("/main")
    public String main() {
    	return"user/main";
    }
    
    @RequestMapping("/admin")
    public String adminPage() {
    	return"admin/admin";
    }
    
  //adminLogin
    
    @GetMapping("/admin")
    public String showAdminLoginForm(Model model) {
        model.addAttribute("user", new User());
        
        return "admin/adminLogin";
    }

    @PostMapping("/admin/adminLogin")
    public String loginAdminUser(User user, HttpServletResponse response) {
        User loginUser = userService.isValidAdminLogin(user);
        System.out.println(loginUser);
        if (loginUser != null) {
            // 로그인 성공 시 처리
            sessionManager.createSession(loginUser, response);
            return "redirect:/admin";
        } else {
            // 로그인 실패 시 처리
            return "redirect:/adminlogin";
        }
    }

    @GetMapping("/admin/main")
    public String showAdminMainPage(HttpServletRequest request, Model model) {
        User loginUser = (User) sessionManager.getSession(request);
        System.out.println(loginUser);
        if (loginUser == null) {
            
            return "redirect:/adminLogin";
        }

        // 로그인 성공 시 메인 페이지로 이동
        model.addAttribute("loginUser", loginUser);
        return "admin/main";
    }

    @GetMapping("/admin/logout")
    public String logoutAdmin(HttpServletRequest request, HttpServletResponse response, Model model) {
        sessionManager.expire(request); // 세션 만료 처리
        Cookie cookie = new Cookie(SessionManager.SESSION_COOKIE_NAME, null);
        cookie.setMaxAge(0); // 쿠키 삭제
        response.addCookie(cookie);

        
        model.addAttribute("sessionExpired", true);

        return "redirect:/adminLogin";
    }
    
    
}
