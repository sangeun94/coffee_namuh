package com.cafeapp.controller.news;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cafeapp.dto.feedback.Feedback;
import com.cafeapp.service.feedback.FeedbackService;

@Controller
@RequestMapping(value = "/customerFeedBack", method = RequestMethod.GET)
public class FeedbackController {
	@Autowired
	FeedbackService feedbackService;
	
	@Autowired
	@RequestMapping("/customerFeedBack")
	public ModelAndView board(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("board");
		int sb_cate = 1;
		if(request.getParameter("sb_cate") != null) {
				sb_cate = Integer.parseInt(request.getParameter("sb_cate"));
				if(sb_cate > 3) {
						sb_cate = 1;
				}
		}
		mv.addObject("boardList", feedbackService.boardList(sb_cate));
//		mv.addObject("category", feedbackService.getCategory(sb_cate));//게시판 카테고리
		mv.addObject("sb_cate",sb_cate);
		
		return mv;
	}
	
	@GetMapping("/write")
	public String write() {
		return "write";
	}
	
	@GetMapping("/write")
	public String write2(Feedback feedback) {
		feedback.setUserid("son");
		feedbackService.write(feedback);
		return "redirect:board?sb_cate=" + feedback.getSb_cate();
	}
	@GetMapping("/detail")
	public ModelAndView detail(@RequestParam("feedbacknumber") Integer feedbacknumber) {
		ModelAndView mv = new ModelAndView("detail");
		mv.addObject("detail", feedbackService.boardDetail(feedbacknumber));
		return mv;
	}
	@GetMapping("/boardDelete")
	public String boardDelete(@RequestParam("feedbacknumber") Integer feedbacknumber) {
		int result = feedbackService.delete(feedbacknumber);
		return "redirect:/board";
	}
	@GetMapping("/boardUpdate")
	public ModelAndView boardUpdate(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("boardUpdate");
		int feedbacknumber = Integer.parseInt(request.getParameter("feedbacknumber"));
		mv.addObject("update", feedbackService.boardDetail(feedbacknumber));
		return mv;
	}
	@PostMapping("/boardUpdate")
	public String boardUpdate2(Feedback feedback) {
		feedbackService.update(feedback);
		return "redirect:/detail?feedbacknumber=" + feedback.getFeedbacknumber();
	}
	
	
}
