package com.cafeapp.dao.menu.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeapp.dao.menu.MenuDAO;

@Repository
public class MenuDAOImpl implements MenuDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
}
