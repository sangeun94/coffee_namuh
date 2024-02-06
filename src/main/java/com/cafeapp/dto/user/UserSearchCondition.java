package com.cafeapp.dto.user;

import lombok.Data;

@Data
public class UserSearchCondition { //검색조건객체
	
	String userId;
	String userEmail;
	String userName;
	String userBirth;
	String userAddress;
	int isMember = -1;
	
	String searchType;
	String searchKeyword;
}
