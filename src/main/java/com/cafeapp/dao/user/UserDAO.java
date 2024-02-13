package com.cafeapp.dao.user;

import java.util.List;
import java.util.Map;

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
	//로그인
    User findLoginUser(User user);
    
    User findLoginAdmin(User user);
    
    //회원가입
    int saveUser(User user);


    //유저 업데이트
    int updateUser(User user);
  
    User findUserById(String userId);
    
    //아이디 찾기
    List<User> findUserByEmail(String userEmail);
    
    int findEmailCheck(String userEmail);
    //
    
    //비밀번호 찾기
    int countUsers(User user);
    int updatePassword(User user);
    //
    
    //회원탈퇴
    int withdrawUser(String userId);
    
   
}
