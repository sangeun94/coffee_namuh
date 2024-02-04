package com.cafeapp.dao.feedback;

import java.util.List;

import com.cafeapp.dto.feedback.Feedback;
import com.cafeapp.dto.feedback.FeedbackSearchCondition;

public interface FeedbackDAO {

	//1:1상담 목록 및 검색
	public List<Feedback> findFeedbackListBySearchCondition(FeedbackSearchCondition feedbackSearchCondition);

	//1:1상담 정보 -> 답변 추가 하기 전에 나오게하는 각각의 정보
	public Feedback findFeedbackByFeedbackNumber(int feedbackNumber);	


}
