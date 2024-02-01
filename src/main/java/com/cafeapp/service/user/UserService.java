package com.cafeapp.service.user;

import java.util.List;

import com.cafeapp.dto.user.User;
import com.cafeapp.dto.user.UserSearchCondition;


public interface UserService {

	//조회 + 검색
	public List<User> findMemberListBySearchCondition(UserSearchCondition userSearchCondition);
	
	//회원 각자 정보 	
	public User findMemberByUserNumber(int userNumber);
	
	//회원정보 수정
	public int modifyMember(User user);
}
