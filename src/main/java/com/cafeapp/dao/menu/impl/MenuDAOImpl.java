package com.cafeapp.dao.menu.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeapp.dao.menu.MenuDAO;
import com.cafeapp.dto.menu.Menu;
import com.cafeapp.dto.menu.MenuList;
import com.cafeapp.dto.menu.MenuSearchCondition;
import com.cafeapp.dto.order.OrderList;
import com.cafeapp.dto.product.ProductList;
import com.cafeapp.dto.product.ProductSearchCondition;
import com.cafeapp.dto.util.FileInfo;

@Repository
public class MenuDAOImpl implements MenuDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;


	@Override
	public List<Menu> ShowMenuList() {

		// TODO Auto-generated method stub
		List<Menu> menuList = sqlSessionTemplate.selectList("menu_mapper.ShowMenuList");

		return menuList;
	}


	//음료리스트 목록 및 검색
	@Override
	public List<MenuList> findDrinkBySearchCondition(MenuSearchCondition menuSearchCondition) {
		// TODO Auto-generated method stub
		
		List<MenuList> menuList = 
				sqlSessionTemplate.selectList("menu_mapper.findDrinkBySearchCondition", menuSearchCondition);
		
		return menuList;
	}

	//파일 정보 생성
	@Override
	public int saveFileInfo(FileInfo fileInfo) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.insert("menu_mapper.saveFileInfo", fileInfo);
		
		return result;
	}

	//DB에 저장된 fileName를 가져오기 위해
	@Override
	public FileInfo findFileInfoByFileName(String fileName) {
		// TODO Auto-generated method stub
		
		FileInfo fileInfo = sqlSessionTemplate.selectOne("menu_mapper.findFileInfoByFileName", fileName);
		
		return fileInfo;
	}

	//음료리스트 생성
	@Override
	public int saveDrinkList(MenuList menuList) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.insert("menu_mapper.saveDrinkList", menuList);
		
		return result;
	}


	//음료 각각의 정보
	@Override
	public MenuList findMenuByMenuNumber(int menuNumber) {
		// TODO Auto-generated method stub
		
		MenuList menuList = sqlSessionTemplate.selectOne("menu_mapper.findMenuByMenuNumber", menuNumber);
		
		return menuList;
	}

	//음료 정보 수정
	@Override
	public int modifyMenu(MenuList menuList) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.update("menu_mapper.modifyMenu", menuList);
				
		return result;
	}


	//음료 삭제
	@Override
	public int removeMenu(int menuNumber) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.delete("menu_mapper.removeMenu", menuNumber);
		
		return result;
	}


//	=========================================
	//푸드리스트 목록 및 검색
	@Override
	public List<MenuList> findFoodBySearchCondition(MenuSearchCondition menuSearchCondition) {
		// TODO Auto-generated method stub
		List<MenuList> menuList = 
				sqlSessionTemplate.selectList("menu_mapper.findFoodBySearchCondition", menuSearchCondition);
		
		return menuList;
	}
	
	//푸드 생성
	@Override
	public int saveFoodList(MenuList menuList) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.insert("menu_mapper.saveFoodList", menuList);
		
		return result;
	}

//	====================================================================
	//상품 리스트 목록 및 검색
	@Override
	public List<ProductList> findProductBySearchCondition(ProductSearchCondition productSearchCondition) {
		// TODO Auto-generated method stub
		
		List<ProductList> productList = 
				sqlSessionTemplate.selectList("menu_mapper.findProductBySearchCondition", productSearchCondition);
		
		return productList;
	}

	//상품 생성
	@Override
	public int saveProductList(ProductList productList) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.insert("menu_mapper.saveProductList", productList);
		
		return result;
	}

	//상품 각각의 정보 불러오기
	@Override
	public ProductList findProductByProductNumber(int productNumber) {
		// TODO Auto-generated method stub
		ProductList productList = sqlSessionTemplate.selectOne("menu_mapper.findProductByProductNumber", productNumber);
		
		return productList;

	}

	//상품 정보 수정
	@Override
	public int modifyProduct(ProductList productList) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.update("menu_mapper.modifyProduct", productList);
		
		return result;
	}


	//상품 삭제
	@Override
	public int removeProduct(int productNumber) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.delete("menu_mapper.removeProduct", productNumber);
		
		return result;
	}
}
