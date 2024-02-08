package com.cafeapp.dto.menu;

import lombok.Data;

@Data
public class MenuSearchCondition {
	
	int menuNumber;
	int menuType;  // 1: 콜드 브루 2: 에스프레소 3: 프라푸치노 4: 티 5: 기타
	String menuName;
	String menuDescription;
	String menuSize; // 1oz 7oz 12oz 16oz
	int menuCalories;
	int menuAllergyInfo; //1: 우유 2: 대두 3: 우유 및 대두 4: 없음
	int menuSaturatedFat; //포화지방
	int menuSugars; 
	int menuSodium; //나트륨
	int menuProtein;
	int menuCaffeine;

	String searchType;
	String searchKeyword;	
	
}
