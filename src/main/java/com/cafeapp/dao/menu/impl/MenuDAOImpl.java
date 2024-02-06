package com.cafeapp.dao.menu.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeapp.dao.menu.MenuDAO;
import com.cafeapp.dto.menu.Menu;

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
}
