package com.cafeapp.dao.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeapp.dao.user.UserDAO;
import com.cafeapp.dto.user.User;
import com.cafeapp.dto.user.UserSearchCondition;

@Repository
public class UserDAOImpl implements UserDAO{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate; //의존성 주입

	//회원 조회 + 검색
	@Override
	public List<User> findMemberListBySearchCondition(UserSearchCondition userSearchCondition) {
		// TODO Auto-generated method stub
		
		List<User> userList = sqlSessionTemplate.selectList("admin_mapper.findMemberListBySearchCondition", userSearchCondition);
		
		return userList;

	}

	//회원 각자 정보
	@Override
	public User findMemberByUserNumber(int userNumber) {
		// TODO Auto-generated method stub
		
		User user = sqlSessionTemplate.selectOne("admin_mapper.findMemberByUserNumber", userNumber);
		
		return user;
	}
	
	
	//회원 정보 수정
	@Override
	public int modifyMember(User user) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.update("admin_mapper.modifyMember", user);
		
		return result;
	}

	
	
	
	
}
