package com.cafeapp.dao.feedback.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeapp.dao.feedback.FeedbackDAO;
import com.cafeapp.dto.feedback.Feedback;
import com.cafeapp.dto.feedback.FeedbackSearchCondition;

@Repository
public class FeedbackDAOImpl implements FeedbackDAO{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	//1:1 상담 목록 및 검색
	@Override
	public List<Feedback> findFeedbackListBySearchCondition(FeedbackSearchCondition feedbackSearchCondition) {
		// TODO Auto-generated method stub
		
		List<Feedback> feedbackList = sqlSessionTemplate.selectList("feedback_mapper.findFeedbackListBySearchCondition", feedbackSearchCondition);
		
		return feedbackList;
	}

	//1:1상담 정보 -> 답변 추가 하기 전에 나오게하는 각각의 정보
	@Override
	public Feedback findFeedbackByFeedbackNumber(int feedbackNumber) {
		// TODO Auto-generated method stub
		
		Feedback feedback = sqlSessionTemplate.selectOne("feedback_mapper.findFeedbackByFeedbackNumber", feedbackNumber);
		
		return feedback;
	}
	
	
}
