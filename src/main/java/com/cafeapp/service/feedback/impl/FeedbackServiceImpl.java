package com.cafeapp.service.feedback.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafeapp.dao.feedback.FeedbackDAO;
import com.cafeapp.dto.feedback.Feedback;
import com.cafeapp.service.feedback.FeedbackService;

@Service
public class FeedbackServiceImpl implements FeedbackService {
	@Autowired
	FeedbackDAO feedbackDAO;
	
	public List<Feedback> boardList(int sb_cate){
		return feedbackDAO.boardList(sb_cate);
	}
	
	public void write(Feedback feedback) {
		feedbackDAO.write(feedback);
	}
	
	public Feedback boardDetail(Integer sb_no) {
		return feedbackDAO.boardDetail(sb_no);
	}
	
	public int delete(Integer sb_no) {
		return feedbackDAO.delete(sb_no);
	}
	
	public int update(Feedback feedback) {
		return feedbackDAO.update(feedback);
	}
	
	/*//게시판 카테고리
	 * public String getCategory(int sb_cate) { return
	 * feedbackDAO.getCategory(sb_cate); }
	 */
}
