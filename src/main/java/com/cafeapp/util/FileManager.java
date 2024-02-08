package com.cafeapp.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.cafeapp.dto.util.FileInfo;


@Component			//Repository -> Component / Service -> Component
public class FileManager {

	private static String fileDirectoryPath = "d:/fileStorage/"; //실제 파일 저장되는 폴더 경로 
	private static String fileUrlPath = "/fileStorage/"; //DB에 저장될때는 /fileStorage/! 나중에 브라우저에서 접근할때 경로

	public FileInfo storeFile(MultipartFile file, String addPath) throws IllegalStateException, IOException { //throws IllegalStateException, IOException : 여기로 책임전가하는!

		FileInfo fileInfo = new FileInfo();
		
		fileInfo.setOriginalFileName(file.getOriginalFilename()); //원래이름
		fileInfo.setFileSize(file.getSize()); //long : 큰단위숫자까지 표현
		fileInfo.setFilePath(fileUrlPath + addPath); //DB에 저장되는 경로
		
		String extension = extractExtension(file.getOriginalFilename()); //확장자만 뽑아낸..(png jpg xml gif)	
		fileInfo.setFileExtension(extension); //확장자
		
		String fileName = createFileName(file.getOriginalFilename());
		fileInfo.setFileName(fileName); //랜덤이름
		
        // 실제 저장될 전체 경로를 포함하여 디렉터리 생성
        String directory = fileDirectoryPath + addPath;
		
		// 파일 저장 (MyReserveProject와는 다른 외부 별도의 폴더에 관리-> 용량이 큰!)
		// fullPath 폴더+파일명+확장자
		file.transferTo(new File( directory + fileInfo.getFileName() )); //실제 파일이 저장되는 경로 //sjfdj.jpg
																//파일명+확장자
		return fileInfo;

	}
	
	public FileInfo storeFile(MultipartFile file) throws IllegalStateException, IOException { //throws IllegalStateException, IOException : 여기로 책임전가하는!
		
		FileInfo fileInfo = new FileInfo();
		
		fileInfo.setOriginalFileName(file.getOriginalFilename()); //랜덤이름
		fileInfo.setFileSize(file.getSize()); //long : 큰단위숫자까지 표현
		fileInfo.setFilePath(fileUrlPath); //DB에 저장되는 경로
		
		String extension = extractExtension(file.getOriginalFilename()); //확장자만 뽑아낸..(png jpg xml gif)	
		fileInfo.setFileExtension(extension); //확장자
		
		String fileName = createFileName(file.getOriginalFilename());
		fileInfo.setFileName(fileName); //저장되는 이름
		
		// 파일 저장 (MyReserveProject와는 다른 외부 별도의 폴더에 관리-> 용량이 큰!)
		// fullPath 폴더+파일명+확장자
		file.transferTo(new File( fileDirectoryPath + fileInfo.getFileName() )); //실제 파일이 저장되는 경로 //sjfdj.jpg
																//파일명+확장자
		return fileInfo;
	}
	
//	private String createFileName(String extension) {
	private String createFileName(String originalFileName) { // 유니크한 식별자 생성 -> 같은사진도 다른이름으로 저장이 됨
//		String fileName = UUID.randomUUID().toString() + "." + extension; //dsfa.jpg
		String fileName = UUID.randomUUID().toString() + "." + extractExtension(originalFileName); //dsfa + . + jpg
		return fileName;
	}
	
	private String extractExtension(String fileName) { //extension을 추출
		int dotIndex = fileName.lastIndexOf("."); // 마지막 .의 위치
		String extension = fileName.substring(dotIndex + 1); //마지막 .의 위치부터 잘라서 jpg만 뽑아내는!
		return extension;
	}
	
	
}
