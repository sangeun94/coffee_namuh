package com.cafeapp.service.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafeapp.common.CommonCode;
import com.cafeapp.dao.user.UserDAO;
import com.cafeapp.dto.user.User;
import com.cafeapp.dto.user.UserSearchCondition;
import com.cafeapp.service.user.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserDAO userDAO; //의존성 주입
	
	//회원 목록 조회
	@Override
	public List<User> findMemberListBySearchCondition(UserSearchCondition userSearchCondition) {
		// TODO Auto-generated method stub
		
		List<User> userList = userDAO.findMemberListBySearchCondition(userSearchCondition);
		
		return userList;

	}


}
