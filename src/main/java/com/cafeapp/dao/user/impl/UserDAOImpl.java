package com.cafeapp.dao.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeapp.dao.user.UserDAO;
import com.cafeapp.dto.user.User;
import com.cafeapp.dto.user.UserSearchCondition;

@Repository
public class UserDAOImpl implements UserDAO{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate; //의존성 주입

	//회원 조회 + 검색
	@Override
	public List<User> findMemberListBySearchCondition(UserSearchCondition userSearchCondition) {
		// TODO Auto-generated method stub
		
		List<User> userList = sqlSessionTemplate.selectList("admin_mapper.findMemberListBySearchCondition", userSearchCondition);
		
		return userList;

	}

	//회원 각자 정보
	@Override
	public User findMemberByUserNumber(int userNumber) {
		// TODO Auto-generated method stub
		
		User user = sqlSessionTemplate.selectOne("admin_mapper.findMemberByUserNumber", userNumber);
		
		return user;
	}
	
	
	//회원 정보 수정
	@Override
	public int modifyMember(User user) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.update("admin_mapper.modifyMember", user);
		
		return result;
	}
	
	//관리자 비밀번호 수정
	@Override
	public int modifyAdmin(User user) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.update("admin_mapper.modifyAdmin", user);
		
		return result;
	}
    
	
	
	// 태현
    @Override
    public User findLoginUser(User user) {
    	user = sqlSessionTemplate.selectOne("user_mapper.findLoginUser", user);
        System.out.println("dao " + user);
        
        return user;
    }
    
    @Override
	public User findLoginAdmin(User user) {
		// TODO Auto-generated method stub
		
    	user = sqlSessionTemplate.selectOne("user_mapper.findLoginAdmin", user);
    	System.out.println("dao" + user);
	    return user;
	}

    @Override
    public int saveUser(User user) {
        return sqlSessionTemplate.insert("user_mapper.saveUser", user);
    }


    @Override
    public User findUserById(String userId) {
        return sqlSessionTemplate.selectOne("user_mapper.findUserById", userId);
    }


    @Override
    public int updateUser(User user) {
        return sqlSessionTemplate.update("user_mapper.updateUser", user);
    }
    
    //email로 id 찾기
	@Override
	public List<User> findUserByEmail(String userEmail) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("user_mapper.findUserByEmail", userEmail);
	}
	
	@Override
    public int findEmailCheck(String userEmail) {
        return sqlSessionTemplate.selectOne("user_mapper.findEmailCheck", userEmail);
    }
	
	@Override
    public int countUsers(User user) {
        return sqlSessionTemplate.selectOne("user_mapper.countUsers", user);
    }

    @Override
    public int updatePassword(User user) {
        return sqlSessionTemplate.update("user_mapper.updatePassword", user);
    }
    
    @Override
    public int withdrawUser(String userId) {
        return sqlSessionTemplate.update("user_mapper.withdrawUser", userId);
    }

    
}
