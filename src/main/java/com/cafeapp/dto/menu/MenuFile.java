package com.cafeapp.dto.menu;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MenuFile {

	int menuNumber;
	int menuType;
	String menuName;
	String menuDescription;
	String menuSize;
	int menuCalories;
	int menuAllergyInfo;
	int menuSaturatedFat;
	int menuSugars;
	int menuSodium;
	int menuProtein;
	int menuCaffeine; 

	MultipartFile profileImage; //파일

}
