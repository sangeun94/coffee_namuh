package com.cafeapp.dto.user;

import lombok.Data;

@Data
public class User {

	int userNumber;
	String userId;
	String userPassword;
	String userConfirmPassword;
	String userEmail;
	String userName;
	String userBirth;
	String userZipcode;
	String userAddress;
	String userDetailAddress;
	int isMember;
}


