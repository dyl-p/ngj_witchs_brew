/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

text = "Mix";

craft_potion = function(_potion) {

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
	
	
	for (var _i = 0 ; _i < ds_list_size(obj_cauldron.brew); _i++){
		if obj_cauldron.brew[|_i] != -1 {
			obj_cauldron.brew[|_i].qty -=1;
			if obj_cauldron.brew[|_i].qty <= 0 {
				obj_cauldron.brew[|_i] = -1;	
			}
		}
	}
}