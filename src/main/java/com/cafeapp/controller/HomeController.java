package com.cafeapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	
	@RequestMapping("/menu/menu_drink")
	public String test() {
		return "menu/menu_drink";
	}
}
