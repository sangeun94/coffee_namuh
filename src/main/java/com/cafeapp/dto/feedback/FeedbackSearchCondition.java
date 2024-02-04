package com.cafeapp.dto.feedback;

import lombok.Data;

@Data
public class FeedbackSearchCondition {

	String userId;
	String title;
	String content;
	String feedbackDate;
	
	String searchType;
	String searchKeyword;
	
}
