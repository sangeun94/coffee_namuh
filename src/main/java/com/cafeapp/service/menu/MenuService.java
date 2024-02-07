package com.cafeapp.service.menu;

import java.util.List;

import com.cafeapp.dto.menu.Menu;
import com.cafeapp.dto.menu.MenuList;
import com.cafeapp.dto.menu.MenuSearchCondition;

public interface MenuService {

	public List<Menu> ShowMenuList();
	
	//음료리스트 목록 및 검색
	public List<MenuList> findDrinkBySearchCondition(MenuSearchCondition menuSearchCondition);
	
}
