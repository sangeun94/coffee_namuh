package com.cafeapp.service.faq.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafeapp.dao.faq.FaqDAO;
import com.cafeapp.dto.board.Faq;
import com.cafeapp.dto.board.FaqSearchCondition;
import com.cafeapp.service.faq.FaqService;

@Service
public class FaqServiceImpl implements FaqService{

	@Autowired
	FaqDAO faqDAO;

	//FAQ 목록 조회 및 검색
	@Override
	public List<Faq> findFaqListBySearchCondition(FaqSearchCondition faqSearchCondition) {
		// TODO Auto-generated method stub
		
		List<Faq> faqList = faqDAO.findFaqListBySearchCondition(faqSearchCondition);
		
		return faqList;

	}

	//FAQ 생성
	@Override
	public int saveFaq(Faq faq) {
		// TODO Auto-generated method stub
		
		int result = faqDAO.saveFaq(faq);
		
		return result;
	}

	//FAQ 각각의 정보
	@Override
	public Faq findFaqByFaqNumber(int faqNumber) {
		// TODO Auto-generated method stub
		
		Faq faq = faqDAO.findFaqByFaqNumber(faqNumber);
		
		return faq;
	}
	
	//FAQ 수정
	@Override
	public int modifyFaq(Faq faq) {
		// TODO Auto-generated method stub
		
		int result = faqDAO.modifyFaq(faq);
		
		return result;
	}

	//FAQ 삭제
	@Override
	public int removeFaq(List<Integer> faqNumbers) {
		// TODO Auto-generated method stub
		
		int result = 0;
		for(int i=0; i<faqNumbers.size(); i++) {
			result = result + faqDAO.removeFaq(faqNumbers.get(i));		
		}
		
		return result;
	}

	
	
}
