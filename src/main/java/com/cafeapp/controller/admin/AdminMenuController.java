package com.cafeapp.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafeapp.dto.menu.MenuList;
import com.cafeapp.dto.menu.MenuSearchCondition;
import com.cafeapp.dto.order.OrderList;
import com.cafeapp.service.menu.MenuService;

@Controller
public class AdminMenuController {

	@Autowired
	MenuService menuService;
	
	//음료 리스트 및 검색
	@RequestMapping("/admin/drinkList")
	public String drinkList(Model model, @ModelAttribute MenuSearchCondition menuSearchCondition) {
		
		System.out.println(menuSearchCondition);
		
		List<MenuList> menuList = menuService.findDrinkBySearchCondition(menuSearchCondition); //검색
		
	    // 각 메뉴 항목에 대해 전체 파일 경로를 설정
	    menuList.forEach(menu -> {
	        String fullFilePath = menu.getFilePath() + menu.getFileName();
	        menu.setFullFilePath(fullFilePath); // MenuList 클래스에 fullFilePath 필드가 있다고 가정
	    });
			
		model.addAttribute("menuList", menuList);
		model.addAttribute("totalMenuList", menuList.size()); //총 음료갯수
		
		return "admin/adminDrinkList";
	}
	
}
