package com.cafeapp.dao.feedback.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeapp.dao.feedback.FeedbackDAO;
import com.cafeapp.dto.feedback.Feedback;
import com.cafeapp.dto.feedback.FeedbackSearchCondition;
import com.cafeapp.dto.feedback.Response;
import com.cafeapp.dto.feedback.ResponseWithFeedback;

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

	//댓글 생성
	@Override
	public int saveResponse(Response response) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.insert("feedback_mapper.saveResponse", response);
		
		return result;
	}

	//댓글 정보 -> 수정하기 전에 나오게하는 각각의 정보
	@Override
	public ResponseWithFeedback findResponseByResponseNumber(int responseNumber) {
		// TODO Auto-generated method stub
		
		ResponseWithFeedback response = sqlSessionTemplate.selectOne("feedback_mapper.findResponseByResponseNumber", responseNumber);
		
		return response;
	}

	//댓글 수정
	@Override
	public int modifyResponse(Response response) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.update("feedback_mapper.modifyResponse", response);
		
		return result;
	}

	//1:1상담 삭제하면 같이 삭제되는 댓글
	@Override
	public int removeFeedbackResponses(int feedbackNumber) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.delete("feedback_mapper.removeFeedbackResponses", feedbackNumber);
		
		return result;
	}
	
	//1:1상담 삭제
	@Override
	public int removeFeedback(int feedbackNumber) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.delete("feedback_mapper.removeFeedback", feedbackNumber);
		
		return result;
	}

	//댓글만 삭제
	@Override
	public int removeResponse(int responseNumber) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.delete("feedback_mapper.removeResponse", responseNumber);

		return result;
	}

	// 현우
	
	public List<Feedback> boardList(){
		List<Feedback> fblist = sqlSessionTemplate.selectList("customerfeedback.boardList");
		return fblist;
	}
	
	public int write(Feedback feedback) {
		int result = sqlSessionTemplate.insert("customerfeedback.write", feedback);
		return result;
	}
	
	public Feedback boardDetail(Integer feedbacknumber) {
		return sqlSessionTemplate.selectOne("customerfeedback.boardDetail",feedbacknumber);
	}
	
	public int delete(Integer feedbacknumber) {
		return sqlSessionTemplate.update("customerfeedback.boardDelete", feedbacknumber);
	}
	
	public int update(Feedback feedback) {
		return sqlSessionTemplate.update("customerfeedback.boardUpdate", feedback);
	}
	
//	public String getCategory(int sb_cate) { //게시판 카테고리
//		return sqlSession.selectOne("customerfeedback.getCategory",sb_cate);
//	}
}
