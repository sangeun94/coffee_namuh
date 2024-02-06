package com.cafeapp.dao.faq.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeapp.dao.faq.FaqDAO;
import com.cafeapp.dto.board.Faq;
import com.cafeapp.dto.board.FaqSearchCondition;

@Repository
public class FaqDAOImpl implements FaqDAO{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate; //의존성 주입

	//FAQ 목록 및 검색
	@Override
	public List<Faq> findFaqListBySearchCondition(FaqSearchCondition faqSearchCondition) {
		// TODO Auto-generated method stub

		List<Faq> faqList = sqlSessionTemplate.selectList("faq_mapper.findFaqListBySearchCondition", faqSearchCondition);
		
		return faqList;
	}

	//FAQ 생성
	@Override
	public int saveFaq(Faq faq) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.insert("faq_mapper.saveFaq", faq);
		
		return result;
	}

	//FAQ 각각의 정보
	@Override
	public Faq findFaqByFaqNumber(int faqNumber) {
		// TODO Auto-generated method stub
		
		Faq faq = sqlSessionTemplate.selectOne("faq_mapper.findFaqByFaqNumber", faqNumber);
		
		return faq;
	}
	
	//FAQ 수정
	@Override
	public int modifyFaq(Faq faq) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.update("faq_mapper.modifyFaq", faq);
		
		return result;
	}

	//FAQ 삭제
	@Override
	public int removeFaq(int faqNumber) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.delete("faq_mapper.removeFaq", faqNumber);
		
		return result;
	}

	
}
