package com.cafeapp.controller.news;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cafeapp.dto.feedback.Feedback;
import com.cafeapp.service.feedback.FeedbackService;

@Controller
public class FeedbackController {
	@Autowired
	FeedbackService feedbackService;
	
	
 //@RequestMapping(value = "/board", method = RequestMethod.GET) 
	@RequestMapping("/board")
	public String board(Model model) {
		List<Feedback> boardList = feedbackService.boardList(); // FeedbackService에서 실제로 구현되어야 합니다.
        model.addAttribute("boardList", boardList);
        System.out.println(boardList);
		return "news/customerFeedBack/board";
	}
	
	@GetMapping("/boardWrite")
	 public String boardWrite() {
        return "news/customerFeedBack/write"; // boardWriteForm.jsp로 이동하도록 설정해야 합니다.
    }
	
	@PostMapping("/write")
	public String write2(@ModelAttribute Feedback feedback) {
	    feedbackService.write(feedback);
	    return "redirect:/board";
	}
	@GetMapping("/detail/{feedbacknumber}")
	public String detail(@PathVariable int feedbacknumber, Model model) {
		Feedback feedback = feedbackService.boardDetail(feedbacknumber);
        model.addAttribute("feedback", feedback);
		return "news/customerFeedBack/detail";
	}
	@GetMapping("/boardDelete/{feedbacknumber}")
	public String boardDelete(@PathVariable int feedbacknumber) {
		feedbackService.delete(feedbacknumber);
        return "redirect:/boardList";
	}
	@GetMapping("/boardUpdate/{feedbacknumber}")
	public String boardUpdate(@PathVariable int feedbacknumber, Model model) {
		Feedback feedback = feedbackService.boardDetail(feedbacknumber);
        model.addAttribute("feedback", feedback);
		return "news/customerFeedBack/boardUpdate";
	}
	@PostMapping("/boardUpdate")
	public String boardUpdate2(@ModelAttribute Feedback feedback) {
		feedbackService.update(feedback);
		return "redirect:/detail"+ feedback.getFeedbackNumber();
	}
	
	
}
