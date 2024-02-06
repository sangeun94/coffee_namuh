package com.cafeapp.dao.user;

import java.util.List;

import com.cafeapp.dto.user.User;
import com.cafeapp.dto.user.UserSearchCondition;


public interface UserDAO {
	//회원 조회 + 검색
	public List<User> findMemberListBySearchCondition(UserSearchCondition userSearchCondition);

	//회원 각자 정보
	public User findMemberByUserNumber(int userNumber);
	
	//회원정보수정
	public int modifyMember(User user);

// 태현
    User findLoginUser(User user);
    
    User findLoginAdmin(User user);

    int saveUser(User user);

    List<User> findUserList();

    User findUserById(String id);

    List<User> findUserListByUserType(String userType);

    int updateUser(User user);
 
}
