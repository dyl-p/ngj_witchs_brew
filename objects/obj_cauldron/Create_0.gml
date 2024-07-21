/// @description Insert description here
// You can write your code in this editor

depth = 100;
brew = ds_list_create();
brew_index = 1;
image_index = brew_index;

for (var _i = 0; _i < 3; _i++){
	var _inst = instance_create_layer(x - 120 + (_i * 120), y - 60, "Instances",obj_inventory_slot);
	
}

#region functions

//check to see if the item already exists in the brew
brew_item_exists = function(_name){
	
	//check to see if the item exists in the list
	for (var _i = 0; _i < ds_list_size(brew); _i++){
		if brew[|_i].nm == _name {
			return true;	
		}
	}
	
	//if the item doesn't already exist in the list
	return false;
}

brew_check_potion = function(){
	var _potions = get_potions_all();
	
	//for every potion
	for (var _i = 0; _i < array_length(_potions); _i++){
		var _correct_ingredients = 0;
		
		//for every ingredient in that potion
		for (var _j = 0; _j < array_length(_potions[_i].ingredients); _j++){
			
			//for each of the ingredients in the brew
			for (var _k = 0; _k < ds_list_size(brew); _k++){
				if brew[|_k].nm == _potions[_i].ingredients[_j] {
					_correct_ingredients++;	
				}
			}
			
			if _correct_ingredients == array_length(_potions[_i].ingredients) {
				return true;	
			}
		}
	}
	
	return false;
}

brew_create_potion = function(){
	var _potions = get_potions_all();
	
	//for every potion
	for (var _i = 0; _i < array_length(_potions); _i++){
		var _correct_ingredients = 0;
		
		//for every ingredient in that potion
		for (var _j = 0; _j < array_length(_potions[_i].ingredients); _j++){
			
			//for each of the ingredients in the brew
			for (var _k = 0; _k < ds_list_size(brew); _k++){
				if brew[|_k].nm == _potions[_i].ingredients[_j] {
					_correct_ingredients++;	
				}
			}
			
			if _correct_ingredients == array_length(_potions[_i].ingredients) {
				potion_add_inventory(_potions[_i].nm);	
			}
		}
	}
}

#endregion