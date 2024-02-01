package com.cafeapp.dao.feedback.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeapp.dao.feedback.FeedbackDAO;
import com.cafeapp.dto.feedback.Feedback;

@Repository
public class FeedbackDAOImpl implements FeedbackDAO{
	@Autowired
	SqlSession sqlSession;
	
	public List<Feedback> boardList(int sb_cate){
		return sqlSession.selectList("customerfeedback.boardList", sb_cate);
	}
	
	public void write(Feedback feedback) {
		sqlSession.insert("customerfeedback.write", feedback);
	}
	
	public Feedback boardDetail(Integer feedbacknumber) {
		return sqlSession.selectOne("customerfeedback.boardDetail",feedbacknumber);
	}
	
	public int delete(Integer feedbacknumber) {
		return sqlSession.update("customerfeedback.boardDelete", feedbacknumber);
	}
	
	public int update(Feedback feedback) {
		return sqlSession.update("customerfeedback.boardUpdate", feedback);
	}
	
//	public String getCategory(int sb_cate) { //게시판 카테고리
//		return sqlSession.selectOne("customerfeedback.getCategory",sb_cate);
//	}
}
