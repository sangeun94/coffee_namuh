package com.cafeapp.service.user;

import com.cafeapp.dto.user.User;
import com.cafeapp.dto.user.UserUpdate;

public interface UserService {

    User isValidCustomerLogin(User user);
    
    User isValidAdminLogin(User user);

    int saveCustomerUser(User user);

    boolean isDuplicatedId(String id);
    
    int updateUser(User user);
}
