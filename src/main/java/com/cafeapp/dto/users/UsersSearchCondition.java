package com.cafeapp.dto.users;

import lombok.Data;

@Data
public class UsersSearchCondition { //검색조건객체
	
	int userNumber;
	String userId;
	String userPassword;
	String userEmail;
	String userName;
	String userZipcode;
	String userAddress;
	String userDetailAddress;
	int isMember;
	
	String searchKeyword;
}
