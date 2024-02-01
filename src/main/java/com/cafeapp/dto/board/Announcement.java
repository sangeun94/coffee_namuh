package com.cafeapp.dto.board;

import lombok.Data;

@Data
public class Announcement {

	int announcementNumber;
	String userId;
	String title;
	String content;
	String postDate; //게시일자
	int announcementsCount;
	
}
