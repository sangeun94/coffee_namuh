package com.cafeapp.controller.news;

import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cafeapp.dao.feedbackresponse.FeedbackResponseDAO;
import com.cafeapp.dto.feedback.Feedback;
import com.cafeapp.dto.feedbackresponse.FeedbackResponseDTO;
import com.cafeapp.service.feedback.FeedbackService;

@Controller
public class FeedbackController {
	@Autowired
	FeedbackService feedbackService;
	
	
 //@RequestMapping(value = "/board", method = RequestMethod.GET) 
	@RequestMapping("/board")
	public String board(Model model) {
		List<Feedback> boardList = feedbackService.boardList(); // FeedbackService에서 실제로 구현되어야 합니다.
        model.addAttribute("boardList", boardList);
        System.out.println(boardList);
		return "news/customerFeedBack/board";
	}
	
	@GetMapping("/boardWrite")
	 public String boardWrite() {
        return "news/customerFeedBack/write"; // boardWriteForm.jsp로 이동하도록 설정해야 합니다.
    }
	
	@PostMapping("/write")
	public String write2(@ModelAttribute Feedback feedback) {
	    feedbackService.write(feedback);
	    return "redirect:/board";
	}
	@GetMapping("/detail/{feedbacknumber}")
	public String detail(@PathVariable int feedbacknumber, Model model) {
		Feedback feedback = feedbackService.boardDetail(feedbacknumber);
        model.addAttribute("feedback", feedback);
		return "news/customerFeedBack/detail";
	}
	@GetMapping("/boardDelete/{feedbacknumber}")
	public String boardDelete(@PathVariable int feedbacknumber) {
		feedbackService.delete(feedbacknumber);
        return "redirect:/boardList";
	}
	@GetMapping("/boardUpdate/{feedbacknumber}")
	public String boardUpdate(@PathVariable int feedbacknumber, Model model) {
		Feedback feedback = feedbackService.boardDetail(feedbacknumber);
        model.addAttribute("feedback", feedback);
		return "news/customerFeedBack/boardUpdate";
	}
	@PostMapping("/boardUpdate")
	public String boardUpdate2(@ModelAttribute Feedback feedback) {
		feedbackService.update(feedback);
		return "redirect:/detail"+ feedback.getFeedbackNumber();
	}
	
	/*
	 * //댓글
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/picture_write_reply.do") public FeedbackResponseDTO
	 * write_reply(@RequestParam int no, @RequestParam String content, HttpSession
	 * session) {
	 * 
	 * FeedbackResponseDTO to = new FeedbackResponseDTO();
	 * 
	 * // 게시물 번호 세팅 to.setResponseNumber(no);
	 * 
	 * // 댓글 내용 세팅 to.setComment(content);
	 * 
	 * // 댓글작성자 nick을 writer로 세팅 to.setUserId((String) session.getAttribute(""));
	 * 
	 * // +1된 댓글 갯수를 담아오기 위함 FeedbackResponseDTO pto =
	 * FeedbackResponseDAO.pictureWriteReply(to);
	 * 
	 * return pto; }
	 * 
	 * // 답글 작성
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/picture_write_rereply.do") public
	 * FeedbackResponseDTO write_rereply(@RequestParam int no, @RequestParam int
	 * bno, @RequestParam String content, HttpSession session) {
	 * 
	 * FeedbackResponseDTO to = new FeedbackResponseDTO();
	 * 
	 * // 게시물 번호 세팅 to.setFeedbackNumber(bno);
	 * 
	 * // grp, grps, grpl 은 ReplyTO에 int로 정의되어 있기 때문에 String인 no를 int로 변환해서 넣어준다. //
	 * 모댓글 번호 no를 grp으로 세팅한다. //to.setGrp(Integer.parseInt(no));
	 * 
	 * // 답글은 깊이가 1이되어야 하므로 grpl을 1로 세팅한다. //to.setGrpl(1);
	 * 
	 * // 답글 내용 세팅 to.setComment(content);
	 * 
	 * // 답글작성자 nick을 writer로 세팅 to.setUserId((String)
	 * session.getAttribute("nick"));
	 * 
	 * // +1된 댓글 갯수를 담아오기 위함 FeedbackResponseDTO pto =
	 * FeedbackResponseDAO.pictureWriteReReply(to);
	 * 
	 * return pto; }
	 * 
	 * // 댓글 리스트
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/picture_replyList.do") public
	 * ArrayList<FeedbackResponseDTO> reply_list(@RequestParam int no, HttpSession
	 * session) {
	 * 
	 * FeedbackResponseDTO to = new FeedbackResponseDTO();
	 * 
	 * // 가져올 댓글 리스트의 게시물번호를 세팅 to.setFeedbackNumber(no);
	 * 
	 * ArrayList<FeedbackResponseDTO> replyList = new ArrayList();
	 * 
	 * replyList = FeedbackResponseDAO.replyList(to);
	 * 
	 * return replyList; }
	 * 
	 * // 모댓글 삭제
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/picture_delete_reply.do") public
	 * FeedbackResponseDTO picture_delete_reply(@RequestParam int no, @RequestParam
	 * int bno ) {
	 * 
	 * FeedbackResponseDTO to = new FeedbackResponseDTO();
	 * 
	 * // 모댓글 번호 세팅 to.setResponseNumber(no);
	 * 
	 * // 게시물 번호 세팅 to.setFeedbackNumber(bno);
	 * 
	 * // 갱신된 댓글 갯수를 담아오기 위함 FeedbackResponseDTO pto =
	 * FeedbackResponseDAO.pictureDeleteReply(to);
	 * 
	 * return pto; }
	 * 
	 * // 답글 삭제
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/picture_delete_rereply.do") public
	 * FeedbackResponseDTO delete_rereply(@RequestParam int no, @RequestParam int
	 * bno, @RequestParam int grp) {
	 * 
	 * FeedbackResponseDTO to = new FeedbackResponseDTO();
	 * 
	 * // 답글 번호 세팅 - 답글 삭제하기 위해서 필요함 to.setResponseNumber(no);
	 * 
	 * // 게시물 번호 세팅 - p_board 의 reply+1하기 위해 필요함 to.setFeedbackNumber(bno);
	 * 
	 * // grp 세팅(모댓글이 뭔지) - 모댓글은 삭제를 해도 답글이 있으면 남아있게 되는데 답글이 모두 삭제되었을 때 모댓글도 삭제하기 위해
	 * // 필요함 //to.setGrp(grp);
	 * 
	 * // 갱신된 댓글 갯수를 담아오기 위함 FeedbackResponseDTO pto =
	 * FeedbackResponseDAO.pictureDeleteReReply(to);
	 * 
	 * return pto; }
	 */
}
