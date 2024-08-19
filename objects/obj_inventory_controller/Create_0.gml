/// @description Insert description here
// You can write your code in this editor

#region object variables

items = ds_list_create();

#endregion

#region functions

//new function for controller to place items
place_items = function(_slot, _item_sel, _item_n_sel = noone, _qty = -1){
	
	//if no quantity is provided then set the qty to the items quantity
	if _qty == -1 {
		_qty = _item_sel.qty;
	}
	
	show_debug_message(_item_sel.name);
	
	//add the item quantities together if they're the same item type
	if _item_n_sel != noone {
		if (_item_sel.name ==  _item_n_sel.name){
			_item_n_sel.qty += _qty;
			_item_sel.qty -= _qty;
		}
	}

	//if there isn't an item where we're placing this
	if _item_n_sel == noone {
		var _item_new = instance_create_layer(_slot.x, _slot.y,"Instances",obj_inventory_item,item_get_struct(_item_sel.name));
		_item_new.qty = _qty;
		_item_sel.qty -= _qty;
	}
	
	
	/*
	//if we're just placing the item into a new slot
	ds_list_replace(_slot.list, _slot.position, item_get_struct(name));
	
	//create the item in the obj_game inventory
	_slot.list[|_slot.position].qty = _qty;
	*/
	
	//decrease our own quantity
	
	//_item_sel.qty -= _qty;
	
	//destroy the item if there are no more!
	if _item_sel.qty <= 0 {
		instance_destroy(_item_sel);	
	}
		
	//recreate inventory items//
}
/*
pickup_item = function(_slot, _qty = -1) {
	//if we didn't just replace this object with a different one, empty the space in inventory
	if _slot.position != -1{
		//check to see if the item in inventory is the same as we just picked up
		//if it is this means we just grabbed it and it should get removed
		if _slot.list[|_slot.position].name == name {
			//set the item in the list to -1 (no item)
			if _qty == -1 {
				ds_list_replace(_slot.list, _slot.position, -1);
			}
		}
	}
}

drop_item = function(_slot, _qty = -1) {
	
	//if no quantity is provided then set the qty to the items quantity
	if _qty == -1 {
		_qty = qty;
	}

	//check to see if there is an item in the space already
	var _item_other = instance_place(x, y, obj_inventory_item);
	
	//add the item quantities together if they're the same item type
	if _item_other != noone && _item_other.name ==  name{
		_qty += _item_other.qty;
	}
		
	var _str = name + ": " + string(_qty);
	show_debug_message(_str);
		
	//move the item to the centre of the slot
	x = _slot.x;
	y = _slot.y;
	
	//if we're just placing the item into a new slot
	ds_list_replace(_slot.list, _slot.position, item_get_struct(name));
	
	//create the item in the obj_game inventory
	_slot.list[|_slot.position].qty = _qty;
		
	//decrease our own quantity
	qty -= _qty;
	
	//destroy the item if there are no more!
	if qty <= 0 {
		instance_destroy();	
	}
		
	//recreate inventory items//
	
	//first destroy all non held inventory items
	with (obj_inventory_item) {
		if !selected {
			instance_destroy();	
		}
	}
		
	//regenerate inventory items
	obj_inventory_display.inventory_create_items();
	
	//destroy the item if there are no more!
	if qty <= 0 {
		instance_destroy();	
	}
}
*/
#endregion