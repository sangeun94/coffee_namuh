package com.cafeapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafeapp.dto.menu.Menu;
import com.cafeapp.service.menu.MenuService;

@Controller
public class MenuController {

	@Autowired
	MenuService menuService;
	
	@RequestMapping("/menu/menu_drink")
	public String menuDrink(Model model) {
		List<Menu> menuList = menuService.ShowMenuList();
	    model.addAttribute("menuList", menuList);
		return "menu/menu_drink";
	}
	
	@RequestMapping("/menu/menu_food")
	public String menuFood(Model model) {
		List<Menu> menuList = menuService.ShowMenuList();
	    model.addAttribute("menuList", menuList);
		return "menu/menu_food";
	}
}
