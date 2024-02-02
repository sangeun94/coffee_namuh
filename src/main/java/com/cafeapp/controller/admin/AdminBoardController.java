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
import com.cafeapp.dto.user.User;
import com.cafeapp.service.announcement.AnnouncementService;

@Controller
public class AdminBoardController { // 공지사항, FAQ, 1:1상담

	@Autowired
	AnnouncementService announcementService;
	
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
	
}
