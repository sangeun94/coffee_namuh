package com.cafeapp.dto.menu;

import lombok.Data;

@Data
public class MenuSearchCondition {
	
	int menuNumber;
	int menuType;
	String menuName;
	String menuDescription;
	String menuSize;
	int menuCalories;
	int menuAllergyInfo;
	int menuSaturatedFat; //포화지방
	int menuSugars; 
	int menuSodium; //나트륨
	int menuProtein;
	int menuCaffeine;

	String searchType;
	String searchKeyword;	
	
}
