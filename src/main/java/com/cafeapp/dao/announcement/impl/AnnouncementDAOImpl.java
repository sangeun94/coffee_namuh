package com.cafeapp.dao.announcement.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeapp.dao.announcement.AnnouncementDAO;
import com.cafeapp.dto.board.Announcement;
import com.cafeapp.dto.board.AnnouncementSearchCondition;

@Repository
public class AnnouncementDAOImpl implements AnnouncementDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate; //의존성 주입

	//공지사항 목록 및 검색
	@Override
	public List<Announcement> findAnnouncementListBySearchCondition(
			AnnouncementSearchCondition announcementSearchCondition) {
		// TODO Auto-generated method stub
		
		List<Announcement> announcementList = 
				sqlSessionTemplate.selectList("announce_mapper.findAnnouncementListBySearchCondition", announcementSearchCondition);
		
		return announcementList;
	}

	//공지사항 생성
	@Override
	public int saveAnnouncement(Announcement announcement) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.insert("announce_mapper.saveAnnouncement", announcement); //namespace.id, 파라미터
		
		return result;

	}
	
	//공지사항 정보
	@Override
	public Announcement findAnnounceByAnnouncementNumber(int announcementNumber) {
		// TODO Auto-generated method stub
		
		Announcement announcement = sqlSessionTemplate.selectOne("announce_mapper.findAnnounceByAnnouncementNumber", announcementNumber);
		
		return announcement;

	}

	//공지사항 수정
	@Override
	public int modifyAnnouncement(Announcement announcement) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.update("announce_mapper.modifyAnnouncement", announcement);
		
		return result;
	}

	
	
}
