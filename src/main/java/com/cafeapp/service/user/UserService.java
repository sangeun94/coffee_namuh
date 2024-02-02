package com.cafeapp.service.user;

import java.util.List;

import com.cafeapp.dto.user.User;

public interface UserService {

    User isValidCustomerLogin(User user);

    int saveCustomerUser(User user);

    boolean isDuplicatedId(String id);
}
