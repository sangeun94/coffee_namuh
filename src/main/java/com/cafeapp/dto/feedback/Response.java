package com.cafeapp.dto.feedback;

import lombok.Data;

@Data
public class Response {
	
	int responseNumber;
	int feedbackNumber;
	String adminId; //user_id : 관리자
	String responseContent;
	String responseDate;
	
}
