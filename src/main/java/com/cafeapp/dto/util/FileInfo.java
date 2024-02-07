package com.cafeapp.dto.util;

import lombok.Data;

@Data
public class FileInfo {

	//DB 저장
	int fileId;
	String fileName; // menu_drink_cold_brew_coffee_나이트로_바닐라_크림.jpg
	String originalFileName;
	String filePath; // /fileStorage/drink/
	String fileExtension;
	long fileSize;
	
}
