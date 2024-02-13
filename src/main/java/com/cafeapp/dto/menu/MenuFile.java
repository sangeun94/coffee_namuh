package com.cafeapp.dto.menu;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MenuFile {

	int menuNumber;
	int menuType;
	String menuName;
	String menuDescription;
	int menuSize;
	int menuCalories;
	int menuAllergyInfo;
	int menuSaturatedFat;
	int menuSugars;
	int menuSodium;
	int menuProtein;
	int menuCaffeine; 

	int previousFileId; // 사용자가 선택하지 않은 경우 기존 파일 정보를 유지 : 이전 파일 ID
	
	MultipartFile profileImage; //파일

}
