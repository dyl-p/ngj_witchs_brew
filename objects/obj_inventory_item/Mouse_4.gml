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
		
		//move the item to the centre of the slot
		x = _inst_slot.x;
		y = _inst_slot.y;
		
		//put the item into the new place in the inventory array
		
		//if the thing is an item
		ds_list_replace(_inst_slot.list, _inst_slot.position, item_get_struct(name));
		
		//if the slot is in the inventory
		if _inst_slot.position != -1 {
			_inst_slot.list[|_inst_slot.position].qty = qty;
		}
	}
	
#endregion
	
} else {
	
	var _inst_slot = instance_place(x, y, obj_inventory_slot);
	
	//if we didn't just replace this object with a different one, empty the space in inventory
	if _inst_slot.position != -1 {
		//check to see if the item in inventory is the same as we just picked up
		if _inst_slot.list[|_inst_slot.position].name == name {
				//set the item in the list to -1 (no item)
				ds_list_replace(_inst_slot.list, _inst_slot.position, -1);
		}
	}
	
	selected = true;
}