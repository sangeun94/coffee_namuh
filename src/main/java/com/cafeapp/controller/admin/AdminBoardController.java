package com.cafeapp.controller.admin;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafeapp.dto.board.Announcement;
import com.cafeapp.dto.board.AnnouncementSearchCondition;
import com.cafeapp.dto.board.Faq;
import com.cafeapp.dto.board.FaqSearchCondition;
import com.cafeapp.dto.feedback.Feedback;
import com.cafeapp.dto.feedback.FeedbackSearchCondition;
import com.cafeapp.dto.feedback.Response;
import com.cafeapp.dto.feedback.ResponseWithFeedback;
import com.cafeapp.dto.user.User;
import com.cafeapp.service.announcement.AnnouncementService;
import com.cafeapp.service.faq.FaqService;
import com.cafeapp.service.feedback.FeedbackService;

@Controller
public class AdminBoardController { // 공지사항, FAQ, 1:1상담

	@Autowired
	AnnouncementService announcementService;
	
	@Autowired
	FaqService faqService;
	
	@Autowired
	FeedbackService feedbackService;
	
	//공지사항 목록 및 검색
	@RequestMapping("/admin/announcement")
	public String announcement(Model model, @ModelAttribute AnnouncementSearchCondition announcementSearchCondition) {		
		System.out.println(announcementSearchCondition);
		
		List<Announcement> announcementList = announcementService.findAnnouncementListBySearchCondition(announcementSearchCondition); //검색
				
		model.addAttribute("announcementList", announcementList);
		model.addAttribute("totalAnnouncement", announcementList.size());
		
		return "admin/adminAnnouncement";
	}
	
	//공지사항 생성
	@GetMapping("/admin/registerAnnounce")
	public String registerAnnounce() {
		
		return "admin/adminAnnouncementRegister";
	}
	
	@PostMapping("/admin/registerAnnounce")
	public String registerAnnounceProcess(Announcement announcement) { //process
		
		System.out.println(announcement);
		
		int result = announcementService.saveAnnouncement(announcement);
		
		if (result > 0) { //저장 성공
			return "redirect:/admin/announcement"; //공지사항 목록 페이지
		} else { //저장 실패
			return "redirect:/admin/registerAnnounce"; //공지사항 생성 페이지
		}

	}
	
	//공지사항 수정
	@GetMapping("/admin/modifyAnnounce")
	public String modifyAnnounce(@RequestParam String announcementNumber, Model model) {
		
		int intannouncementNumber = Integer.parseInt(announcementNumber);
		//userNumber가 int인데 혹시나 파라미터로 String이 넘어올수도 있으니까 그 오류가 안나오게 하기위해!
				
		Announcement announcement = announcementService.findAnnounceByAnnouncementNumber(intannouncementNumber); //위에서 string으로 받아버렸으니까 원래상태인 int로 변환!
		
		System.out.println(announcement);
		
		model.addAttribute("announcement", announcement);
		
		return "admin/adminAnnouncementModify";
	}
	
	@PostMapping("/admin/modifyAnnounce")
	public String modifyAnnounceProcess(Announcement announcement) { //파라미터는 user객체!
		System.out.println(announcement);
			
		int result = announcementService.modifyAnnouncement(announcement);
		
		if (result > 0) { //저장 성공
			return "redirect:/admin/announcement"; //수정성공: 공지사항 목록 페이지
		} else { //저장 실패
			return "admin/adminAnnouncementModify"; //수정실패: 공지사항 수정페이지 
		}
		
	}
	
	//공지사항 삭제
	@PostMapping("/admin/removeAnnounce")
	public String removeAnnounce(@RequestParam List<String> announcementNumber) {

		System.out.println(announcementNumber);

		// String 리스트를 Integer 리스트로 변환
	    List<Integer> numbers = announcementNumber.stream()
	                                               .map(Integer::parseInt)
	                                               .collect(Collectors.toList());
	    
		announcementService.removeAnnouncement(numbers);
		
		return "redirect:/admin/announcement";
	}
	
//	=============================================================================
	//FAQ 목록 및 검색
	@RequestMapping("/admin/faq")
	public String faq(Model model, @ModelAttribute FaqSearchCondition faqSearchCondition) {
		System.out.println(faqSearchCondition);
		
		List<Faq> faqList = faqService.findFaqListBySearchCondition(faqSearchCondition); //검색
				
		model.addAttribute("faqList", faqList);
		model.addAttribute("totalFaq", faqList.size());

		
		return "admin/adminFaq";
	}
	
	//FAQ 생성
	@GetMapping("/admin/registerFaq")
	public String registerFaq() {
		
		return "admin/adminFaqRegister";
	}
	
	@PostMapping("/admin/registerFaq")
	public String registerFaqProcess(Faq faq) { //process
		
		System.out.println(faq);
		
		int result = faqService.saveFaq(faq);
		
		if (result > 0) { //저장 성공
			return "redirect:/admin/faq"; //FAQ 목록 페이지
		} else { //저장 실패
			return "redirect:/admin/registerFaq"; //FAQ 생성 페이지
		}

	}
	
	//FAQ 수정
	@GetMapping("/admin/modifyFaq")
	public String modifyFaq(@RequestParam String faqNumber, Model model) {
		
		int intFaqNumber = Integer.parseInt(faqNumber);
		//userNumber가 int인데 혹시나 파라미터로 String이 넘어올수도 있으니까 그 오류가 안나오게 하기위해!
				
		Faq faq = faqService.findFaqByFaqNumber(intFaqNumber); //위에서 string으로 받아버렸으니까 원래상태인 int로 변환!
		
		System.out.println(faq);
		
		model.addAttribute("faq", faq);
		
		return "admin/adminFaqModify";
	}
	
	@PostMapping("/admin/modifyFaq")
	public String modifyFaqProcess(Faq faq) { 
		System.out.println(faq);
			
		int result = faqService.modifyFaq(faq);
		
		if (result > 0) { //저장 성공
			return "redirect:/admin/faq"; //수정성공: FAQ 목록 페이지
		} else { //저장 실패
			return "admin/adminFaqModify"; //수정실패: FAQ 수정페이지 
		}
		
	}
	
	
	//FAQ 삭제
	@PostMapping("/admin/removeFaq")
	public String removeFaq(@RequestParam List<String> faqNumber) {

		System.out.println(faqNumber);

		// String 리스트를 Integer 리스트로 변환
	    List<Integer> numbers = faqNumber.stream().map(Integer::parseInt)
	                                               .collect(Collectors.toList());
	    
		faqService.removeFaq(numbers);
				
		return "redirect:/admin/faq";
	}
	
//	===================================================================
	
	//1:1 상담 목록 및 검색
	@RequestMapping("/admin/feedback")
	public String feedback(Model model, @ModelAttribute FeedbackSearchCondition feedbackSearchCondition) {
		System.out.println(feedbackSearchCondition);
		
		List<Feedback> feedbackList = feedbackService.findFeedbackListBySearchCondition(feedbackSearchCondition); //검색
				
		model.addAttribute("feedbackList", feedbackList);
		model.addAttribute("totalFeedback", feedbackList.size());

		
		return "admin/adminFeedback";
	}
	
	//상담 댓글 생성 , 상담 정보 제공
	@GetMapping("/admin/registerResponse")
	public String registerResponse(@RequestParam String feedbackNumber, Model model) {
		
		int intFeedbackNumber = Integer.parseInt(feedbackNumber);
		//userNumber가 int인데 혹시나 파라미터로 String이 넘어올수도 있으니까 그 오류가 안나오게 하기위해!
				
		Feedback feedback = feedbackService.findFeedbackByFeedbackNumber(intFeedbackNumber); //위에서 string으로 받아버렸으니까 원래상태인 int로 변환!
		
		System.out.println(feedback);
		
		model.addAttribute("feedback", feedback);

		return "admin/adminFeedResRegister";
	}
	
	@PostMapping("/admin/registerResponse")
	public String registerResponseProcess(Response response) { //process
		
		System.out.println(response);
		
		int result = feedbackService.saveResponse(response);
		
		if (result > 0) { //저장 성공
			return "redirect:/admin/feedback"; //1:1상담문의 목록 페이지
		} else { //저장 실패
			return "redirect:/admin/registerResponse"; //댓글 생성 페이지
		}

	}
	
	//댓글 수정
	@GetMapping("/admin/modifyResponse")
	public String modifyResponse(@RequestParam String responseNumber, Model model) {
		
		int intResponseNumber = Integer.parseInt(responseNumber);
		//userNumber가 int인데 혹시나 파라미터로 String이 넘어올수도 있으니까 그 오류가 안나오게 하기위해!
				
		ResponseWithFeedback response = feedbackService.findResponseByResponseNumber(intResponseNumber); //위에서 string으로 받아버렸으니까 원래상태인 int로 변환!
		
		System.out.println(response);
		
		model.addAttribute("response", response);
		
		return "admin/adminFeedResModify";
	}
	
	@PostMapping("/admin/modifyResponse")
	public String modifyResponseProcess(Response response) { 
		System.out.println(response);
			
		int result = feedbackService.modifyResponse(response);
		
		if (result > 0) { //저장 성공
			return "redirect:/admin/feedback"; //수정성공: feedback 목록 페이지
		} else { //저장 실패
			return "admin/adminFeedResModify"; //수정실패: 댓글 수정페이지 
		}
		
	}
	
	//1:1상담+댓글 삭제
	@PostMapping("/admin/removeFeedback")
	public String removeFeedback(@RequestParam List<String> feedbackNumber) {

		System.out.println(feedbackNumber);

		// String 리스트를 Integer 리스트로 변환
	    List<Integer> numbers = feedbackNumber.stream().map(Integer::parseInt)
	                                               .collect(Collectors.toList());
	    
		feedbackService.removeFeedback(numbers);
				
		return "redirect:/admin/feedback";
	}
	
	//댓글만 삭제
	@PostMapping("/admin/removeResponse")
	public String removeResponseProcess(@RequestParam String responseNumber) {
		
		int intResponseNumber = Integer.parseInt(responseNumber);
		
		int result = feedbackService.removeResponse(intResponseNumber); 
		
		if (result > 0) {
			return "redirect:/admin/feedback"; //삭제성공: feedback 목록 페이지
		} else {
			return "admin/adminFeedResModify"; //삭제실패 : 삭제페이지
		}
		
	}
	
}
