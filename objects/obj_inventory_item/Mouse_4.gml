/// @description Insert description here
// You can write your code in this editor


if selected {
	
	//check to see if there is a slot or other item
	var _inst_slot = instance_position(mouse_x, mouse_y, obj_inventory_slot);
	
	//get the item that is already in this slot (if any)
	var _inst_item = noone;
	
	//from the view of the inventory slot
		
	_inst_item = instance_place(x, y, obj_inventory_item);
	
	//show_debug_message(_inst_item);
	//if _inst_item { show_debug_message(_inst_item.selected); }
	
	//if there is a slot, center to where the item should be
	if _inst_slot {
		x = _inst_slot.x;
		y = _inst_slot.y;
		selected = false;	
	}
	
	//if there is an item, pick it up
	//if _inst_item {
	//	_inst_item.selected = true;	
	//}
	
	//put the item into the new place in the inventory array
	ds_list_replace(obj_game.inventory, _inst_slot.position, item_get_struct(nm));
	obj_game.inventory[|_inst_slot.position].qty = qty;
	
} else {
	
	var _inst_slot = instance_place(x, y, obj_inventory_slot);
	
	//if we didn't just replace this object with a different one, empty the space in inventory
	if obj_game.inventory[|_inst_slot.position].nm == nm {
		ds_list_replace(obj_game.inventory, _inst_slot.position, -1);
	}
	
	selected = true;
}