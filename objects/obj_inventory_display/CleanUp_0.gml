/// @description Insert description here
// You can write your code in this editor

//array of inventory slots used

/*
var _slot_pos = [];

with obj_inventory_item {
	
	// find the slot that the item is in
	var _slot = instance_place(x, y, obj_inventory_slot);
	
	//add the position to the array so we know what items not to remove from the inventory ds_list
	array_push(_slot_pos, _slot.position);
	
	//replace the item in the inventory ds_list, set the quantity
	ds_list_replace(obj_game.inventory, _slot.position, item_get_struct(name))
	obj_game.inventory[|_slot.position].qty = qty;
}

//get length of _slot_pos array so we don't have to do something more costly
var _len = array_length(_slot_pos);

//sort the array for consisten use in the following loop
array_sort(_slot_pos,false);
show_debug_message(_slot_pos);

for (var _i = 0; _i < ds_list_size(obj_game.inventory); _i++;) {
	
	//if the last item is not the current _i then set it to -1
	
	if _len >= 0 {
		if _i != _slot_pos[_len - 1] {
			//reset the place in the inventory because there shouldn't be something here.
			ds_list_replace(obj_game.inventory,_i, -1);
		}
	} else {
		//remove the last item if we've found it
		array_pop(_slot_pos);
		_len -= 1;
	}
}
*/