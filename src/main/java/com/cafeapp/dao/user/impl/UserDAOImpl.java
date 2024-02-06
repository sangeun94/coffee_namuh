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

// 태현
    @Override
    public int saveUser(User user) {
        return sqlSessionTemplate.insert("user_mapper.saveUser", user);
    }

    @Override
    public List<User> findUserList() {
        return sqlSessionTemplate.selectList("user_mapper.findUserList");
    }

    @Override
    public User findUserById(String id) {
        return sqlSessionTemplate.selectOne("user_mapper.findUserById", id);
    }

    @Override
    public List<User> findUserListByUserType(String userType) {
        return sqlSessionTemplate.selectList("user_mapper.findUserListByUserType", userType);
    }

    @Override
    public int updateUser(User user) {
        return sqlSessionTemplate.update("user_mapper.updateUser", user);
    }
	
	
	
}
