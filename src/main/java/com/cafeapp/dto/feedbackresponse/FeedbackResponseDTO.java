package com.cafeapp.dto.feedbackresponse;

import lombok.Data;

@Data
public class FeedbackResponseDTO {
	
	    Long responseNumber;
	    Long feedbackNumber;
	    String userId;
	    String comment;
	    String responseDate;
}
