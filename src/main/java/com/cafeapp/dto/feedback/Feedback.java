package com.cafeapp.dto.feedback;

import java.util.Date;

import lombok.Data;

@Data
public class Feedback {
	int feedbacknumber;
	String userid;
	String title;
	String content;
	Date feedback_date;
	int feedbackcount;
	int sb_cate;
}
