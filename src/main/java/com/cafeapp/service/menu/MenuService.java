package com.cafeapp.service.menu;

import java.util.List;

import com.cafeapp.dto.menu.Menu;
import com.cafeapp.dto.menu.MenuObject;

public interface MenuService {

	public List<Menu> ShowMenuList();
	
	public List<MenuObject> OnlyShowMenuList();
}
