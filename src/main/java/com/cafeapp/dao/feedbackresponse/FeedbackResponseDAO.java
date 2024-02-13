package com.cafeapp.dao.feedbackresponse;

import java.util.ArrayList;

import com.cafeapp.dto.feedbackresponse.FeedbackResponseDTO;

public interface FeedbackResponseDAO {

	public FeedbackResponseDTO pictureWriteReply(FeedbackResponseDTO to);
	
	public FeedbackResponseDTO pictureWriteReReply(FeedbackResponseDTO to);
	
	public ArrayList<FeedbackResponseDTO> replyList(FeedbackResponseDTO to);
	
	public FeedbackResponseDTO pictureDeleteReply(FeedbackResponseDTO to);
	
	public FeedbackResponseDTO pictureDeleteReReply(FeedbackResponseDTO to);
	
	public FeedbackResponseDTO profile_pictureWriteReply(FeedbackResponseDTO to);
	
}
