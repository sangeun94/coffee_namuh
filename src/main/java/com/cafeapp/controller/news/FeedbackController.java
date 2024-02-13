package com.cafeapp.controller.news;

import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.cafeapp.dto.feedback.Feedback;
import com.cafeapp.dto.feedback.Response;
import com.cafeapp.service.feedback.FeedbackService;
import com.cafeapp.service.user.UserService;
import com.cafeapp.util.LoginManager;

@Controller
public class FeedbackController {
	@Autowired
	FeedbackService feedbackService;
	@Autowired
	UserService userService;
	@Autowired
	LoginManager loginManager;

	
 //@RequestMapping(value = "/board", method = RequestMethod.GET) 
	@RequestMapping("/board")
	public String board(Model model) {
		List<Feedback> boardList = feedbackService.boardList(); // FeedbackService에서 실제로 구현되어야 합니다.
        model.addAttribute("boardList", boardList);
        System.out.println(boardList);
		return "news/customerFeedBack/board";
	}
	
	@GetMapping("/boardWrite")
	public String boardWrite1() {
		return "news/customerFeedBack/write";
	}
	
	
	@PostMapping("/boardWrite")
	 public String boardWrite(Feedback feedback, HttpSession session) {

		System.out.println(feedback);
		String userId = loginManager.getUserId(session);
		
		feedback.setUserId(userId);
		
    	int result = feedbackService.write(feedback);
    	
    	if(result > 0) {
    		return "redirect:board";
    	} else {
        return "news/customerFeedBack/write"; // boardWriteForm.jsp로 이동하도록 설정해야 합니다.
    	}
    }
	
//	@PostMapping("/write")
//	public String write2(@ModelAttribute Feedback feedback) {
//	    feedbackService.write(feedback);
//	    return "redirect:/board";
//	}
	@GetMapping("/detail/{feedbacknumber}")
	public String detail(@PathVariable int feedbacknumber, Model model,HttpSession session) {
		Feedback feedback = feedbackService.boardDetail(feedbacknumber);
        model.addAttribute("feedback", feedback);
        System.out.println(feedback);
        
        // 현재 로그인한 사용자의 아이디를 가져옴
        String loggedInUserId = loginManager.getUserId(session);
        model.addAttribute("loggedInUserId", loggedInUserId);
        
        List<Response> responseList = feedbackService.findResponselistByFeedbackNumber(feedbacknumber);
	    System.out.println("response List 확인 -----------------");
	    System.out.println(responseList);
	    model.addAttribute("responseList", responseList);
        
		return "news/customerFeedBack/detail";
	}
	@GetMapping("/boardDelete/{feedbacknumber}")
	public String boardDelete(@PathVariable int feedbacknumber) {
		feedbackService.delete(feedbacknumber);
        return "redirect:/board";
	}
	@GetMapping("/boardUpdate/{feedbacknumber}")
	public String boardUpdate(@PathVariable int feedbacknumber, Model model, HttpSession session) {
	    Feedback feedback = feedbackService.boardDetail(feedbacknumber);
	    model.addAttribute("feedback", feedback);
	    String loggedInUserId = loginManager.getUserId(session);
        model.addAttribute("loggedInUserId", loggedInUserId);
	    return "news/customerFeedBack/boardUpdate";
	}

	@PostMapping("/boardUpdate/{feedbacknumber}")
	public String boardUpdate(@PathVariable int feedbacknumber, @RequestBody Feedback updatedFeedback) {
	    updatedFeedback.setFeedbackNumber(feedbacknumber);
	    feedbackService.update(updatedFeedback);
	    return "redirect:/board";
	}
	
	//댓글리스트
//	@RequestMapping("/detail/{feedbacknumber}")
//	public String responseList(@PathVariable int feedbacknumber, HttpSession session, Model model) {
//	    List<Response> responseList = feedbackService.findResponselistByFeedbackNumber(feedbacknumber);
//	    System.out.println("response List 확인 -----------------");
//	    System.out.println(responseList);
//	    model.addAttribute("responseList", responseList);
//	    
//	    return "news/customerFeedBack/detail";
//	}
	
}
