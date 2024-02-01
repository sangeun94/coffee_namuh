package com.cafeapp.dao.user;

import java.util.List;

import com.cafeapp.dto.user.User;

public interface UserDAO {
    User findLoginUser(User user);

    int saveUser(User user);

    List<User> findUserList();

    User findUserById(String id);

    List<User> findUserListByUserType(String userType);
}
