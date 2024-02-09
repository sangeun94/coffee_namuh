package com.cafeapp.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

// 태현
	@Override
	public User isValidCustomerLogin(User user) {
		// 로그인 로직 구현
		System.out.println("service " + user);
		User loginUser = userDAO.findLoginUser(user);
		System.out.println("service " + loginUser);
		// 사용자가 회원인 경우에만 로그인 허용
		if (loginUser != null && loginUser.getIsMember() == CommonCode.USER_ISMEMBER_MEMBER) {
			loginUser.setIsMember(CommonCode.USER_ISMEMBER_MEMBER); // 이 부분 수정
			System.out.println("service " + loginUser);
			return loginUser;
		}

		return null; // 로그인 실패
	}

	@Override
	public User isValidAdminLogin(User user) {
		// 관리자 로그인 로직 구현
		System.out.println("service " + user);
		User adminLoginUser = userDAO.findLoginAdmin(user);
		System.out.println("service " + adminLoginUser);
		if (adminLoginUser != null && adminLoginUser.getIsMember() == CommonCode.USER_ISMEMBER_ADMIN) {
			adminLoginUser.setIsMember(CommonCode.USER_ISMEMBER_ADMIN); // 이 부분 수정
			System.out.println("service " + adminLoginUser);
			return adminLoginUser;
		}
		return null;
	}

	@Override
	public int saveCustomerUser(User user) {
		// 사용자 등록 로직 구현
		System.out.println("Saving user in service: " + user.toString());
		return userDAO.saveUser(user);
	}

	@Override
	public boolean isDuplicatedId(String id) {
		// 중복된 아이디 확인 로직 구현
		return userDAO.findUserById(id) != null;
	}

	@Override
    public int updateUserInfo(User user) {
        return userDAO.updateUser(user);
    }

	@Override
	public User findUserById(String userId) {
		// TODO Auto-generated method stub
		return userDAO.findUserById(userId);
	}

	
	@Override
    public List<User> findUserByEmail(String userEmail) {
        return userDAO.findUserByEmail(userEmail);
    }

	@Override
	public int findEmailCheck(String userEmail) {
		// TODO Auto-generated method stub
		return userDAO.findEmailCheck(userEmail);
	}
	
	@Override
    public int countUsers(User user) {
        return userDAO.countUsers(user);
    }

    @Override
    public boolean updatePassword(User user) {
        int rowsAffected = userDAO.updatePassword(user);
        return rowsAffected > 0;
    }
	
    @Override
    public int withdrawUser(String userId) {
        return userDAO.withdrawUser(userId);
    }
}
