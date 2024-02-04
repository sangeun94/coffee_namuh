package com.cafeapp.dao.faq;

import java.util.List;

import com.cafeapp.dto.board.Faq;
import com.cafeapp.dto.board.FaqSearchCondition;

public interface FaqDAO {
	
	//FAQ 글 조회 + 검색
	public List<Faq> findFaqListBySearchCondition(FaqSearchCondition faqSearchCondition);

	//FAQ 생성
	public int saveFaq(Faq faq);

	//FAQ 정보 -> 수정하기 전에 나오게하는 각각의 정보
	public Faq findFaqByFaqNumber(int faqNumber);	
	
	//FAQ 수정
	public int modifyFaq(Faq faq);
	
	//FAQ 삭제
	public int removeFaq(int faqNumber);

}
