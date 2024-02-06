package com.cafeapp.dto.feedback;

import lombok.Data;

@Data
public class ResponseWithFeedback {
	
	int responseNumber;
	int feedbackNumber;
	String adminId; //댓글 테이블
	String responseContent;
	String responseDate;
	String userId; //1:1상담 테이블
	String title;
	String content;
	String feedbackDate;
	
}
