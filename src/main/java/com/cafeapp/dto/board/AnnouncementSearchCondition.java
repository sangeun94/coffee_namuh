package com.cafeapp.dto.board;

import lombok.Data;

@Data
public class AnnouncementSearchCondition {
	
	String title;
	String content;
	String postDate; //게시일자
	
	String searchType;
	String searchKeyword;
}
