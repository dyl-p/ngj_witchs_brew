/// @description Insert description here
// You can write your code in this editor


if selected {

#region check if we're placing on an inventory slot

	//check to see if there is a slot or other item
	var _inst_slot = instance_position(mouse_x, mouse_y, obj_inventory_slot);
	
	
	//if there is a slot, center to where the item should be
	if _inst_slot {
		//the item is no longer selected
		selected = false;
		
		drop_item(_inst_slot);
	}
	
#endregion

#region check to see if we're picking up an item
} else {
	
	var _inst_slot = instance_place(x, y, obj_inventory_slot);

	pickup_item(_inst_slot);
	
	selected = true;
}
#endregion