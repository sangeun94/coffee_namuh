package com.cafeapp.service.menu.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafeapp.dao.menu.MenuDAO;
import com.cafeapp.dto.menu.Menu;
import com.cafeapp.dto.menu.MenuList;
import com.cafeapp.dto.menu.MenuSearchCondition;
import com.cafeapp.dto.product.ProductList;
import com.cafeapp.dto.product.ProductSearchCondition;
import com.cafeapp.dto.util.FileInfo;
import com.cafeapp.service.menu.MenuService;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	MenuDAO menuDAO;

	@Override
	public List<Menu> ShowMenuList() {
		List<Menu> menuList = menuDAO.ShowMenuList();
		return menuList;
	}

	//음료리스트 목록 및 검색
	@Override
	public List<MenuList> findDrinkBySearchCondition(MenuSearchCondition menuSearchCondition) {
		// TODO Auto-generated method stub
		
		List<MenuList> menuList = menuDAO.findDrinkBySearchCondition(menuSearchCondition);
		
		return menuList;
	}

	//파일 정보 생성
	@Override
	public int saveFileInfo(FileInfo fileInfo) {
		// TODO Auto-generated method stub
		
		int result = menuDAO.saveFileInfo(fileInfo);
		
		return result;
	}

	//DB에 저장된 fileName를 가져오기 위해
	@Override
	public FileInfo findFileInfoByFileName(String fileName) {
		// TODO Auto-generated method stub
		
		FileInfo fileInfo = menuDAO.findFileInfoByFileName(fileName);
		
		return fileInfo;
	}

	//음료리스트 생성
	@Override
	public int saveDrinkList(MenuList menuList) {
		// TODO Auto-generated method stub
		
		int result = menuDAO.saveDrinkList(menuList);
		
		return result;
	}

	//각각 음료 정보
	@Override
	public MenuList findMenuByMenuNumber(int menuNumber) {
		// TODO Auto-generated method stub
		
		MenuList menuList = menuDAO.findMenuByMenuNumber(menuNumber);
		
		return menuList;
	}

	//음료 정보 수정
	@Override
	public int modifyMenu(MenuList menuList) {
		// TODO Auto-generated method stub
		
		int result = menuDAO.modifyMenu(menuList);
		
		return result;
	}

	//음료 삭제
	@Override
	public int removeMenu(List<Integer> menuNumbers) {
		// TODO Auto-generated method stub
		
		int result = 0;
		for (int i=0; i<menuNumbers.size(); i++) {
			result = result + menuDAO.removeMenu(menuNumbers.get(i));
		}
		
		return result;

	}
	
//	=========================================
	//푸드리스트 목록 및 검색
	@Override
	public List<MenuList> findFoodBySearchCondition(MenuSearchCondition menuSearchCondition) {
		// TODO Auto-generated method stub
		List<MenuList> menuList = menuDAO.findFoodBySearchCondition(menuSearchCondition);
		
		return menuList;
	}
	
	//푸드리스트 생성
	@Override
	public int saveFoodList(MenuList menuList) {
		// TODO Auto-generated method stub
		
		int result = menuDAO.saveFoodList(menuList);
		
		return result;
	}

//	=========================================================
	//상품리스트 목록 및 검색
	@Override
	public List<ProductList> findProductBySearchCondition(ProductSearchCondition productSearchCondition) {
		// TODO Auto-generated method stub
		
		List<ProductList> productList = menuDAO.findProductBySearchCondition(productSearchCondition);
		
		return productList;
	}

	//상품 생성
	@Override
	public int saveProductList(ProductList productList) {
		// TODO Auto-generated method stub
		
		int result = menuDAO.saveProductList(productList);
		
		return result;
	}
	
	//상품 각각의 정보 불러오기
	@Override
	public ProductList findProductByProductNumber(int productNumber) {
		// TODO Auto-generated method stub
		ProductList productList = menuDAO.findProductByProductNumber(productNumber);
		
		return productList;
	}
	
	//상품 정보 수정
	@Override
	public int modifyProduct(ProductList productList) {
		// TODO Auto-generated method stub
		
		int result = menuDAO.modifyProduct(productList);
		
		return result;
	}

	//상품 삭제
	@Override
	public int removeProduct(List<Integer> productNumbers) {
		// TODO Auto-generated method stub
		
		int result = 0;
		for (int i=0; i<productNumbers.size(); i++) {
			result = result + menuDAO.removeProduct(productNumbers.get(i));
		}
		
		return result;

	}
}
