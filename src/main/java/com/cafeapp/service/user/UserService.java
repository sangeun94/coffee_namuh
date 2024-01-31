package com.cafeapp.service.user;

import java.util.List;

import com.cafeapp.dto.user.User;
import com.cafeapp.dto.user.UserSearchCondition;



public interface UserService {

	//검색
	public List<User> findMemberListBySearchCondition(UserSearchCondition userSearchCondition);

}
