package com.cafeapp.service.announcement;

import java.util.List;

import com.cafeapp.dto.board.Announcement;
import com.cafeapp.dto.board.AnnouncementSearchCondition;

public interface AnnouncementService {

	//공지사항 글 조회 + 검색
	public List<Announcement> findAnnouncementListBySearchCondition(AnnouncementSearchCondition announcementSearchCondition);

	//공지사항 생성
	public int saveAnnouncement(Announcement announcement);

	//공지사항 정보
	public Announcement findAnnounceByAnnouncementNumber(int announcementNumber);
	
	//공지사항 수정
	public int modifyAnnouncement(Announcement announcement);
	
	//공지사항 삭제
	public int removeAnnouncement(List<Integer> announcementNumbers);

}
