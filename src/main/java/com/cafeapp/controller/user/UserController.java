package com.cafeapp.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
        	return "redirect:/login";
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
    public String loginUser(User user, HttpServletResponse response, HttpSession session, RedirectAttributes redirectAttributes) {
    	System.out.println(user);
        User loginUser = userService.isValidCustomerLogin(user);

        System.out.println(loginUser);
        if (loginUser != null) {
            // 로그인 성공 시 처리
        	loginManager.setSessionLogin(loginUser.getUserId(), session);
            //sessionManager.createSession(loginUser, response);
        	// 사용자 이름도 세션에 저장
            session.setAttribute("userName", loginUser.getUserName());
            
            return "redirect:/main";
        } else {
            // 로그인 실패 시 처리
        	redirectAttributes.addAttribute("loginFailed", true);
            return "redirect:/login";
        }
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
    
   
    
    @RequestMapping("/main")
    public String main() {
    	return"mainhome/mainhome";
    }
    
   
  //adminLogin
    @GetMapping("/admin/adminLogin")
    public String adminPage() {
    	return"admin/adminLogin";
    }
    
    
    

    @PostMapping("/admin/adminLogin")
    public String loginAdminUser(User user, HttpServletResponse response ,HttpSession session, RedirectAttributes redirectAttributes) {
        User adminLoginUser = userService.isValidAdminLogin(user);
        
        System.out.println(adminLoginUser);
        
        System.out.println(adminLoginUser);
        if (adminLoginUser != null) {
            // 로그인 성공 시 처리
        	loginManager.setSessionLogin(adminLoginUser.getUserId(), session);
            return "redirect:/admin/adminMember";
        } else {
            // 로그인 실패 시 처리
        	redirectAttributes.addAttribute("loginFailed", true);
        	return "redirect:/admin/adminLogin";
        }
        
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

    
    @PostMapping("/mypage")
    public String showMyPageProcess(User user, HttpSession session) {
        // 여기서 user에는 모달 폼에서 넘어온 데이터가 담겨 있습니다.
    	loginManager.isLogin(session);
    	String userId = loginManager.getUserId(session);
    	
        // Update 로직 수행
        int result = userService.updateUserInfo(user);

        if (result > 0) {
            // 업데이트 성공 시
            return "redirect:/mypage";
        } else {
            // 업데이트 실패 시
            return "user/main";
        }
    }
    
    
    
    @GetMapping("/getFindId")
    public String getFindIdPage() {
        return "user/getFindId";
    }

    
    @PostMapping("/findId")
    public String getFindId(String userEmail, Model model) {
        try {
            List<User> userList = userService.findUserByEmail(userEmail);

            if (userList == null) {
                model.addAttribute("msg", "이메일을 확인해주세요");
                return "user/getFindId";
            } else {
                model.addAttribute("user", userList);
                return "user/findId";
            }
        } catch (Exception e) {
            // 예외 처리
            e.printStackTrace();
            model.addAttribute("msg", "오류가 발생했습니다");
            return "user/findId";
        }
    }

    @GetMapping("/findId")
    public String findIdPage() {
        return "user/findId";
    }

    
    
 
   

     @GetMapping("/getFindPw")
     public String findPwPage(Model model) {
            
         return "user/getFindPw";
     }
     
     @PostMapping("findPw")
     public String findPwdCheck(HttpServletRequest request, Model model,
							             @RequestParam("userId") String id,
							             @RequestParam("userName") String name,
							             @RequestParam("userEmail") String email,
							             User user) {
         try {
             user.setUserId(id);
             user.setUserName(name);
             user.setUserEmail(email);

             int search = userService.countUsers(user);

             if (search == 0) {
                 model.addAttribute("msg", "기입된 정보가 잘못되었습니다. 다시 입력해주세요.");
             }

             String newPwd = RandomStringUtils.randomAlphanumeric(10);
             user.setUserPassword(newPwd);
             user.setUserConfirmPassword(newPwd);
             userService.updatePassword(user);

             model.addAttribute("newPwd", newPwd);

         } catch (Exception e) {
             e.printStackTrace();
             model.addAttribute("msg", "오류가 발생되었습니다.");
         }
         return "user/findPw";
     }

       
     
  // 회원탈퇴 페이지로 이동
     @GetMapping("/withdrawal")
     public String withdrawalPage() {
         return "user/withdrawal";
     }

     // 회원탈퇴
     @PostMapping("/withdrawal")
     public String withdrawUser(@RequestParam("userId") String userId, Model model) {
         int result = userService.withdrawUser(userId);
         if (result > 0) {
             model.addAttribute("withdrawalSuccess", true);
         } else {
             model.addAttribute("withdrawalSuccess", false);
         }
         return "user/withdrawal"; 
     }
    
     //로그아웃
     @GetMapping("/logout")
     public String logout(HttpSession session) {
     	loginManager.logout(session);
     	
         return "redirect:/login";
     }
     
     
     
    @RequestMapping("/brand")
    public String brand() {
    	return "introduction/brand";
    }
     
     
     

    }

