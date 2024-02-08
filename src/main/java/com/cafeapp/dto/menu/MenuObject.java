package com.cafeapp.dto.menu;

import lombok.Data;

@Data
public class MenuObject {
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
	String filePath;
	String fileName;
	String originalFileName;
}
