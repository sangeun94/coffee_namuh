package com.cafeapp.controller.news;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafeapp.dto.board.Announcement;
import com.cafeapp.dto.board.AnnouncementSearchCondition;
import com.cafeapp.dto.board.Faq;
import com.cafeapp.dto.board.FaqSearchCondition;
import com.cafeapp.dto.feedback.Feedback;
import com.cafeapp.service.announcement.AnnouncementService;
import com.cafeapp.service.faq.FaqService;


@Controller
public class NewsController {
	
	@Autowired
	FaqService faqService;
	
	@Autowired
	AnnouncementService announcementService;
	
	/*
	 * @Autowired FeedBackResponseService feedbackResponseService;
	 * 
	 */
	
	
	
	@RequestMapping("/notice")
	public String announcement(Model model, @ModelAttribute AnnouncementSearchCondition announcementSearchCondition) {		
		System.out.println(announcementSearchCondition);
		
		List<Announcement> announcementList = announcementService.findAnnouncementListBySearchCondition(announcementSearchCondition); //검색
				
		model.addAttribute("announcementList", announcementList);
		model.addAttribute("totalAnnouncement", announcementList.size());
		
		System.out.println(announcementList);
		return "news/notice/notice";
	}
	
	@GetMapping("/noticedetail/{noticenumber}")
	public String noticedetail(@PathVariable int noticenumber, Model model) {
		Announcement announcement = announcementService.findAnnounceByAnnouncementNumber(noticenumber);
        model.addAttribute("announcement", announcement);
        System.out.println(announcement);
		return "news/notice/noticedetail";
	}
	
	@RequestMapping("/faq")
	public String faq(Model model, @ModelAttribute FaqSearchCondition faqSearchCondition) {
		System.out.println(faqSearchCondition);
		
		List<Faq> faqList = faqService.findFaqListBySearchCondition(faqSearchCondition); //검색
				
		model.addAttribute("faqList", faqList);
		model.addAttribute("totalFaq", faqList.size());

		
		return "news/faq/faq";
	}
	
	@GetMapping("/faqdetail/{faqnumber}")
	public String faqdetail(@PathVariable int faqnumber, Model model) {
		Faq faq = faqService.findFaqByFaqNumber(faqnumber);
        model.addAttribute("faq", faq);
		return "news/faq/faqdetail";
	}
	
	@RequestMapping("/header")
	public String header() {
		return "header/header";
	}
}
