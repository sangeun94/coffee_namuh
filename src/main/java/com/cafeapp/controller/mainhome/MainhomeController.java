package com.cafeapp.controller.mainhome;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainhomeController {
	@RequestMapping("/mainhome")
	public String Main() {
		return "mainhome/mainhome";
	}
}
