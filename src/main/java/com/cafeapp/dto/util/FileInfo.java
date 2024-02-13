package com.cafeapp.dto.util;

import lombok.Data;

@Data
public class FileInfo {

	// DB 저장
	int fileId;
	String fileName; //저장되는 이름(파일명+확장자)
	String originalFileName; //원래 이름
	String filePath; ///fileStorage/
	String fileExtension;
	long fileSize; //큰 숫자까지 표현가능!
}
