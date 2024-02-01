package com.cafeapp.service.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        return userDAO.findLoginUser(user);
    }

    @Override
    public int saveCustomerUser(User user) {
        // 사용자 등록 로직 구현
    	System.out.println("Saving user in service: " + user.toString());
        return userDAO.saveUser(user);
    }

    @Override
    public List<User> findCustomerUserList() {
        // 사용자 목록 조회 로직 구현
        return userDAO.findUserListByUserType("CUS");
    }

    @Override
    public boolean isDuplicatedId(String id) {
        // 중복된 아이디 확인 로직 구현
        return userDAO.findUserById(id) != null;
    }
}
