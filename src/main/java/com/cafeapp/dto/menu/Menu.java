package com.cafeapp.dto.menu;

import lombok.Data;

@Data
public class Menu {
	int menuNumber;
	int menuType;		//menuType;
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
	int fileId;
}




