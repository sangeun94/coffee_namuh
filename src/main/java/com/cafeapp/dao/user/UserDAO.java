package com.cafeapp.dao.user;

import java.util.List;

import com.cafeapp.dto.user.User;
import com.cafeapp.dto.user.UserSearchCondition;


public interface UserDAO {
	//검색
	public List<User> findMemberListBySearchCondition(UserSearchCondition userSearchCondition);

}
