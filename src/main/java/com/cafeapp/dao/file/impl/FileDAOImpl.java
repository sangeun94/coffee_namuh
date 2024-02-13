package com.cafeapp.dao.file.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeapp.dao.file.FileDAO;
import com.cafeapp.dto.file.File;

@Repository
public class FileDAOImpl implements FileDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<File> ShowFileList() {
		List<File> fileList = sqlSessionTemplate.selectList("file_mapper.ShowFileList");
	
		return fileList;
	}
}
