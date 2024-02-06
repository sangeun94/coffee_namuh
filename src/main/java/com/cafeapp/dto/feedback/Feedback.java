package com.cafeapp.dto.feedback;

import lombok.Data;

@Data
public class Feedback {
	int feedbackNumber;
	String userId;
	String title;
	String content;
	String feedbackDate;
	int feedbackCount;
	
	String responseContent;
	int responseNumber;
}
