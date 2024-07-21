/// @description Insert description here
// You can write your code in this editor


if selected {

#region check if we're placing on an inventory slot

	//check to see if there is a slot or other item
	var _inst_slot = instance_position(mouse_x, mouse_y, obj_inventory_slot);
	
	
	//if there is a slot, center to where the item should be
	if _inst_slot {
		x = _inst_slot.x;
		y = _inst_slot.y;
		selected = false;	
	
		//put the item into the new place in the inventory array
		
		//if the thing is an item
		if type == "item" {
			//if the slot is in the inventory
			if _inst_slot.position != -1 {
				ds_list_replace(obj_game.inventory, _inst_slot.position, item_get_struct(nm));
			}
		//if the thing is a potion
		} else if type == "potion" {
			ds_list_replace(obj_game.inventory, _inst_slot.position, potion_get_struct(nm));
		}
		
		//if the slot is in the inventory
		if _inst_slot.position != -1 {
			obj_game.inventory[|_inst_slot.position].qty = qty;
		}
	}
	
#endregion

//#region check to see if we're placing on the cauldron

//	var _cauldron = instance_position(mouse_x, mouse_y, obj_cauldron);
	
//	if _cauldron && !_cauldron.brew_item_exists(nm){
//		ds_list_add(_cauldron.brew,item_get_struct(nm));
//		qty -= 1;
		
//		if qty == 0 {
//			instance_destroy();	
//		}
//	}
	

//#endregion
	
} else {
	
	var _inst_slot = instance_place(x, y, obj_inventory_slot);
	
	//if we didn't just replace this object with a different one, empty the space in inventory
	if _inst_slot.position != -1 {
		if obj_game.inventory[|_inst_slot.position].nm == nm {
				ds_list_replace(obj_game.inventory, _inst_slot.position, -1);
		}
	}
	
	selected = true;
}