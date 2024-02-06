package com.cafeapp.dto.board;

import lombok.Data;

@Data
public class Faq {

	int faqNumber;
	String userId;
	String question;
	String answer;
	String postDate;
	int faqsCount;
	
}
