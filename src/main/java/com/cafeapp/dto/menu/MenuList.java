package com.cafeapp.dto.menu;

import lombok.Data;

@Data
public class MenuList {

	int menuNumber;
	int menuType;		//menuType;
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
	int fileId;
	
	String fileName; // menu_drink_cold_brew_coffee_나이트로_바닐라_크림.jpg //랜덤이름
	String originalFileName; //원래이름
	String filePath; // /fileStorage/drink/
	String fileExtension;
	long fileSize;
	
	String fullFilePath; // join 으로 한번에 file_path + file_name 가져오는 경우
}
