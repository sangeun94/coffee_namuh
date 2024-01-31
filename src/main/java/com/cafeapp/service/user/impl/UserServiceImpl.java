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
	
	//회원 목록 조회+검색
	@Override
	public List<User> findMemberListBySearchCondition(UserSearchCondition userSearchCondition) {
		// TODO Auto-generated method stub
		
		List<User> userList = userDAO.findMemberListBySearchCondition(userSearchCondition);
		
		return userList;

	}
	
	//회원 각자 정보
	@Override
	public User findMemberByUserNumber(int userNumber) {
		// TODO Auto-generated method stub
		
		User user = userDAO.findMemberByUserNumber(userNumber);
		
		return user;
	}
	
	
	//회원 정보 수정
	@Override
	public int modifyMember(User user) {
		// TODO Auto-generated method stub
		
		int result = userDAO.modifyMember(user);
		
		return result;
	}



}
