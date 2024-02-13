package com.cafeapp.service.file.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafeapp.dao.file.FileDAO;
import com.cafeapp.dto.file.File;
import com.cafeapp.service.file.FileService;

@Service
public class FileServiceImpl implements FileService {

	@Autowired
	FileDAO fileDAO;
	
	@Override
	public List<File> ShowFileList() {
		List<File> fileList = fileDAO.ShowFileList();
		return fileList;
	}
}
