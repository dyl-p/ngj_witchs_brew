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

//make sure we're actually trying to interact with something
if _items_len > 0 && _slot != noone && _item_sel != noone{
	place_items(_slot,_item_sel,_item_n_sel,1);
}

//if we're just right clicking an object that isn't selected
if _items_len > 0 && _item_n_sel != noone && _item_sel == noone {
	
	//TODO finish this thang
	
	var _mix_slot = []
	
	if instance_exists(obj_cauldron){
		show_debug_message("I got righ-clicked <3");	
	}
	
}


ds_list_clear(items);