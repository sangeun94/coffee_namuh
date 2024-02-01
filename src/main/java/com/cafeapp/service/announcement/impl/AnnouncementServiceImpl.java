package com.cafeapp.service.announcement.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafeapp.dao.announcement.AnnouncementDAO;
import com.cafeapp.dto.board.Announcement;
import com.cafeapp.dto.board.AnnouncementSearchCondition;
import com.cafeapp.dto.user.User;
import com.cafeapp.service.announcement.AnnouncementService;

@Service
public class AnnouncementServiceImpl implements AnnouncementService {

	@Autowired
	AnnouncementDAO announcementDAO;

	//공지사항 목록 및 검색
	@Override
	public List<Announcement> findAnnouncementListBySearchCondition(AnnouncementSearchCondition announcementSearchCondition) {
		// TODO Auto-generated method stub
		
		List<Announcement> AnnouncementList = announcementDAO.findAnnouncementListBySearchCondition(announcementSearchCondition);
		
		return AnnouncementList;
	}

	//공지사항 생성
	@Override
	public int saveAnnouncement(Announcement announcement) {
		// TODO Auto-generated method stub
		int result = announcementDAO.saveAnnouncement(announcement);
		
		return result;
	}

	//공지사항 정보
	@Override
	public Announcement findAnnounceByAnnouncementNumber(int announcementNumber) {
		// TODO Auto-generated method stub
		
		Announcement announcement = announcementDAO.findAnnounceByAnnouncementNumber(announcementNumber);
		
		return announcement;
		
	}
	
	//공지사항 수정
	@Override
	public int modifyAnnouncement(Announcement announcement) {
		// TODO Auto-generated method stub
		
		int result = announcementDAO.modifyAnnouncement(announcement);
		
		return result;
	}

	
	
}
