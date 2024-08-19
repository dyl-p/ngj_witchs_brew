/// @description Insert description here
// You can write your code in this editor

show_debug_message("Left Pressed");

//get all the inventory items that collide with this object, if any
var _items_len = instance_position_list(x, y, obj_inventory_item, items, false);

//get the slot we're interacting with, if any
var _slot = instance_position(x, y, obj_inventory_slot);

//throw an error if we have more than 2 items, because we shouldn't ever
if _items_len >= 3 {
	show_debug_message("WARNING: obj_i_c - left pressed: Too many items being interacted with.")	
}


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

if _items_len == 2 {
//if we're trying to place this item on top of a different item swap the two items
if _item_n_sel.name != _item_sel.name {
	_item_n_sel.selected = true;
	place_items(_slot, _item_sel);
	
} else if _item_n_sel.name == _item_sel.name {
	place_items( _slot,_item_sel, _item_n_sel);
}


//if we're placing this item on top of a like item add the amount of the held item to the unheld item
	//if we place more than the items max then ensure you continue to hold that much item

} else if _items_len == 1 && _slot != noone{

	// if there is only one item then pickup or drop off the selected item
	if _item_n_sel == noone {	
		
		place_items(_slot,_item_sel);
		
	} else if _item_sel == noone {
		_item_n_sel.selected = true;
		
		ds_list_replace(_slot.list, _slot.position,-1);
	}
}

ds_list_clear(items);