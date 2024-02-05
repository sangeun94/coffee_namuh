package com.cafeapp.service.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafeapp.common.CommonCode;
import com.cafeapp.dao.user.UserDAO;
import com.cafeapp.dto.user.User;
import com.cafeapp.service.user.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

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
		User adminLoginUser = userDAO.findLoginAdmin(user);
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

}
