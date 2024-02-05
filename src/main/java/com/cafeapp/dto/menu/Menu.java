package com.cafeapp.dto.menu;

import lombok.Data;

@Data
public class Menu {
	int menu_number;
	int menu_type;
	String menu_name;
	String menu_description;
	String menu_size;
	int menu_calories;
	int menu_allergy_info;
	int menu_saturated_fat;
	int menu_sugars;
	int menu_sodium;
	int menu_protein;
	int menu_caffeine; 
	int file_id;
}




