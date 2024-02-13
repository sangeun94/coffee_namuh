package com.cafeapp.service.menu;

import java.util.List;

import com.cafeapp.dto.menu.Menu;
import com.cafeapp.dto.menu.MenuList;
import com.cafeapp.dto.menu.MenuSearchCondition;
import com.cafeapp.dto.util.FileInfo;

public interface MenuService {

	public List<Menu> ShowMenuList();
	
	//음료리스트 목록 및 검색
	public List<MenuList> findDrinkBySearchCondition(MenuSearchCondition menuSearchCondition);
	
	//파일 정보 생성
	public int saveFileInfo(FileInfo fileInfo);
	
	//DB에 저장된 fileName를 가져오기 위해
	public FileInfo findFileInfoByFileName(String fileName);
	
	//음료리스트 생성
	public int saveDrinkList(MenuList menuList);
	
	//각각 음료 정보
	public MenuList findMenuByMenuNumber(int menuNumber);
	
	//음료 정보 수정
	public int modifyMenu(MenuList menuList);
	
	//음료 삭제
	public int removeMenu(List<Integer> menuNumbers);
	
//	========================================
	//푸드리스트 목록 및 검색
	public List<MenuList> findFoodBySearchCondition(MenuSearchCondition menuSearchCondition);

	//푸드리스트 생성
	public int saveFoodList(MenuList menuList);
	
}
