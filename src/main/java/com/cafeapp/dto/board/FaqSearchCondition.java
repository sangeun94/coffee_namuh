package com.cafeapp.dto.board;

import lombok.Data;

@Data
public class FaqSearchCondition {
	
	String question;
	String answer;
	String postDate;
	
	String searchType;
	String searchKeyword;
}
