package com.cafeapp.service.feedback.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafeapp.dao.feedback.FeedbackDAO;
import com.cafeapp.dto.feedback.Feedback;
import com.cafeapp.dto.feedback.FeedbackSearchCondition;
import com.cafeapp.dto.feedback.Response;
import com.cafeapp.dto.feedback.ResponseWithFeedback;
import com.cafeapp.service.feedback.FeedbackService;

@Service
public class FeedbackServiceImpl implements FeedbackService{

	@Autowired
	FeedbackDAO feedbackDAO;

	//1:1 상담 목록 및 검색
	@Override
	public List<Feedback> findFeedbackListBySearchCondition(FeedbackSearchCondition feedbackSearchCondition) {
		// TODO Auto-generated method stub
		
		List<Feedback> feedbackList = feedbackDAO.findFeedbackListBySearchCondition(feedbackSearchCondition);
		
		return feedbackList;
	}

	//1:1상담 정보 -> 답변 추가 하기 전에 나오게하는 각각의 정보
	@Override
	public Feedback findFeedbackByFeedbackNumber(int feedbackNumber) {
		// TODO Auto-generated method stub
		
		Feedback feedback = feedbackDAO.findFeedbackByFeedbackNumber(feedbackNumber);
		
		return feedback;
	}

	//댓글 생성
	@Override
	public int saveResponse(Response response) {
		// TODO Auto-generated method stub
		
		int result = feedbackDAO.saveResponse(response);
		
		return result;
	}

	//댓글 정보 -> 수정하기 전에 나오게하는 각각의 정보
	@Override
	public ResponseWithFeedback findResponseByResponseNumber(int responseNumber) {
		// TODO Auto-generated method stub
		
		ResponseWithFeedback response = feedbackDAO.findResponseByResponseNumber(responseNumber);
		
		return response;
	}
	
	//댓글 수정
	@Override
	public int modifyResponse(Response response) {
		// TODO Auto-generated method stub
		
		int result = feedbackDAO.modifyResponse(response);
		
		return result;
	}

	//1:1상담 + 댓글 삭제
    @Transactional
	@Override
	public int removeFeedback(List<Integer> feedbackNumbers) {
		// TODO Auto-generated method stub
		int result = 0;
		
        for(Integer number : feedbackNumbers) {
            // 댓글 먼저 삭제
            feedbackDAO.removeFeedbackResponses(number);
            // 그 후 상담 데이터 삭제
            result += feedbackDAO.removeFeedback(number);
        }
		
		return result;
	}

	//댓글만 삭제
	@Override
	public int removeResponse(int responseNumber) {
		// TODO Auto-generated method stub
		
		int result = feedbackDAO.removeResponse(responseNumber);
		
		return result;
	}
	
	
	
}
