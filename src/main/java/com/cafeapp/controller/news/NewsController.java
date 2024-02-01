package com.cafeapp.controller.news;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NewsController {
	@RequestMapping("/Notice")
	public String Notice() {
		return "news/notice/notice";
	}
	
	@RequestMapping("/faq")
	public String Faq() {
		return "news/faq/faq";
	}
}
