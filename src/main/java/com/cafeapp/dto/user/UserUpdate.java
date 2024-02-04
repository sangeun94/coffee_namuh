package com.cafeapp.dto.user;

import lombok.Data;

@Data
public class UserUpdate {
    private String userId; 
    private String userPassword; 
    private String userEmail; 
    private String userBirth; 
    private String userZipcode;
    private String userAddress; 
    private String userDetailAddress;
    private String field; 
    private String value; 
}

