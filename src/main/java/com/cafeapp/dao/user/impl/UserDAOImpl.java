package com.cafeapp.dao.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeapp.dao.user.UserDAO;
import com.cafeapp.dto.user.User;

@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

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

	
}
