/// @description Insert description here
// You can write your code in this editor

show_debug_message("Right Pressed");

//get the slot we're interacting with, if any
var _slot = instance_position(x, y, obj_inventory_slot);

var _items_len = instance_position_list(x, y, obj_inventory_item, items, false);

var _item_sel = noone;
var _item_n_sel = noone;

//determine if there is a selected or not selected item
for (var _i = 0; _i < _items_len; _i++){
	if items[|_i].selected == false {
		_item_n_sel = items[|_i];	
	} else {
		_item_sel = items[|_i];
	}	
}

place_items(_slot,_item_sel,_item_n_sel,1);


ds_list_clear(items);