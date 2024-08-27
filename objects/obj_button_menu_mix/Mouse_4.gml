/// @description Insert description here
// You can write your code in this editor

//check to see if the items in the brew match any potion
with obj_cauldron {
	
	var _ingredients = []
	
	for (var _i = 0; _i < ds_list_size(brew); _i++ ){
		if brew[|_i] != -1 {
			array_push(_ingredients, brew[|_i].name);
		}
	}
	
	show_debug_message("Mix Array: " + string(_ingredients));
	
	var _potion = potion_check_recipe(_ingredients);
	
	//if the ingredients dont make a recipe return all items
	if _potion == -1 {
		
		show_debug_message("No potion found.");

		//item_return_inventory(brew, obj_game.inventory);

		for (var _i = 0; _i < ds_list_size(brew); _i++) {
			
			if brew[|_i] != -1 {
			
				//the brew slot check for an item
				with obj_inventory_slot {
					if list == other.brew && position == _i {
						var _item = instance_place(x, y, obj_inventory_item);
					
						var _pos = item_add_inventory(obj_game.inventory, other.brew[|_i].name);
						obj_game.inventory[|_pos].qty += other.brew[|_i].qty - 1;
						
						//put the item in the inventory slot
						with obj_inventory_slot {
							if position == _pos && list == obj_game.inventory {
								var _item_inv = instance_place(x, y, obj_inventory_item);
								if _item_inv {
									_item_inv.qty += _item.qty;	
								} else {
									var _item_new = instance_create_layer(x, y, "Instances", obj_inventory_item, item_get_struct(_item.name));
									_item_new.qty = _item.qty;
								}
							}
						}
					
						instance_destroy(_item);
					}
				}
				brew[|_i] = -1;
			}
		}
	
	//if the ingredients do make a recipe decrease their quantity by 1 and create a potion\
	} else { 
		var _pos = item_add_inventory(obj_game.inventory, _potion);
		
		//create the potion item in the inventory screen
		
		//look at every inventory slot
		with obj_inventory_slot{
			
			//if it's the slot that the item_add function returned then do the following
			if position == _pos && list == obj_game.inventory {
				
				//check to see if there is another item in this spot
				var _item = instance_place(x, y, obj_inventory_item);
				
				if _item != noone{
					_item.qty += 1;	
					show_debug_message("added to existing item");
					
				} else {
					instance_create_layer(x, y, "Instances", obj_inventory_item, item_get_struct(_potion));
					show_debug_message("created a who new thang");
				}
			}
			
			if list == obj_cauldron.brew {
				var _item = instance_place(x,y,obj_inventory_item);
				
				if _item != noone {
					_item.qty -= 1;	
				}
			}
		}
		for (var _i = 0 ; _i < ds_list_size(brew); _i++){
			if brew[|_i] != -1 {
				brew[|_i].qty -=1;
				if brew[|_i].qty <= 0 {
					brew[|_i] = -1;	
				}
			}
		}
	}
}

//if yes create the potion

//otherwise remove all items from the brew, back to the inventory?