package com.cafeapp.service.feedback;

import java.util.List;

import com.cafeapp.dto.feedback.Feedback;

public interface FeedbackService {
	
	public List<Feedback> boardList(int sb_cate);
	
	public void write(Feedback feedback);
	
	public Feedback boardDetail(Integer sb_no);
	
	public int delete(Integer sb_no);
	
	public int update(Feedback feedback);
	
	/* public String getCategory(int sb_cate); */ //게시판 카테고리
}
