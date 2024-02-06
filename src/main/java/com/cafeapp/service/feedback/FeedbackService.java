package com.cafeapp.service.feedback;

import java.util.List;

import com.cafeapp.dto.feedback.Feedback;
import com.cafeapp.dto.feedback.FeedbackSearchCondition;
import com.cafeapp.dto.feedback.Response;
import com.cafeapp.dto.feedback.ResponseWithFeedback;

public interface FeedbackService {

	//1:1 상담 목록 및 검색
	public List<Feedback> findFeedbackListBySearchCondition(FeedbackSearchCondition feedbackSearchCondition);

	//1:1상담 정보 -> 답변 추가 하기 전에 나오게하는 각각의 정보
	public Feedback findFeedbackByFeedbackNumber(int feedbackNumber);
	
	//댓글 생성
	public int saveResponse(Response response);
	
	//댓글 정보 -> 수정하기 전에 나오게하는 각각의 정보
	public ResponseWithFeedback findResponseByResponseNumber(int responseNumber);

	//댓글 수정
	public int modifyResponse(Response response);
	
	//1:1상담 삭제
	public int removeFeedback(List<Integer> feedbackNumbers);
	
	//댓글만 삭제
	public int removeResponse(int responseNumber);

	public List<Feedback> boardList();
	
	public void write(Feedback feedback);
	
	public Feedback boardDetail(Integer sb_no);
	
	public int delete(Integer sb_no);
	
	public int update(Feedback feedback);
}
