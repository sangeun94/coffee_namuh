package com.cafeapp.dao.menu;

import java.util.List;

import com.cafeapp.dto.menu.Menu;
import com.cafeapp.dto.menu.MenuObject;


public interface MenuDAO {

	public List<Menu> ShowMenuList();
	
	public List<MenuObject> OnlyShowMenuList();
}