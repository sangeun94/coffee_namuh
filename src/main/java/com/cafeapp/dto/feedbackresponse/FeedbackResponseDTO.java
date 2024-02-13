package com.cafeapp.dto.feedbackresponse;

import lombok.Data;

@Data
public class FeedbackResponseDTO {
	
	    int responseNumber;
	    int feedbackNumber;
	    String userId;
	    String comment;
	    String responseDate;
}
