/// @description Insert description here
// You can write your code in this editor

#region check if we're placing on an inventory slot
/*
if selected {



	//check to see if there is a slot or other item
	var _inst_slot = instance_position(mouse_x, mouse_y, obj_inventory_slot);
	
	show_debug_message(_inst_slot.position);
	
	//if there is a slot, center to where the item should be
	if _inst_slot {
		//the item is no longer selected
		selected = false;
		
		drop_item(_inst_slot);
	}
	
#endregion

#region check to see if we're picking up an item
} else {
	
	var _inst_slot = instance_position(mouse_x, mouse_y, obj_inventory_slot);
	
	show_debug_message("Pickup Location: " + string(_inst_slot.position));

*/
	
	/*
	We're the item ready to be picked up
	
	If we are going to get picked up that means
		1. we aren't selected <-- we already know this if we're at this part of the code
		2. there isn't a similar item being held
	*/
	/*
	var _list = ds_list_create();
	var _num = instance_place_list(x, y, obj_inventory_item, _list, false);
	
	show_debug_message("Collisions: " + string(_num));

	if (_num > 0){
		show_debug_message("Multiple Items");
	} else {
		selected = true;
		pickup_item(_inst_slot);	
	}

	ds_list_destroy(_list);
	
} */
#endregion