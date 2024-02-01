package com.cafeapp.dao.feedback;

import java.util.List;

import com.cafeapp.dto.feedback.Feedback;

public interface FeedbackDAO {
	
	public List<Feedback> boardList(int sb_cate);
	
	public void write(Feedback feedback);
	
	public Feedback boardDetail(Integer feedbacknumber);
	
	public int delete(Integer feedbacknumber);
	
	public int update(Feedback feedback);
	
//	public String getCategory(int sb_cate);//게시판 카테고리
}
