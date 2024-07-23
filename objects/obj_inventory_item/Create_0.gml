/// @description Insert description here
// You can write your code in this editor

/*
It is assumed that a struct with the sprite
and description of the item is used in this
item's create event which creates a number of other variables

Name the following:
//the basic pieces of data required to define an inventory item
function Item () constructor {
	name = "";			//name of item
	desc = "";			//description of item
	spr = noone;		//sprite of item
	qty = 1;			//quantity of item
	loc = -1;
	type = "item";		//used to identify between different 
						//types of things in the inventory
	val = 0;			//monetary value of the item
}
*/

//what this item should look like
sprite_index = spr;

//if this item was selected
selected = false;

pickup_item = function(_slot, _qty = -1) {
	//if we didn't just replace this object with a different one, empty the space in inventory
	if _slot.position != -1{
		//check to see if the item in inventory is the same as we just picked up
		if _slot.list[|_slot.position].name == name {
			//set the item in the list to -1 (no item)
			if _qty == -1 {
				ds_list_replace(_slot.list, _slot.position, -1);
			}
		}
	}
}

drop_item = function(_slot, _qty = -1) {
	
	if _qty == -1 {
		_qty = qty;
	}	

	//check to see if there is an item in the space already
	var _item_other = instance_place(x, y, obj_inventory_item)
	
	//add the item quantities together if they're the same item type
	if _item_other != noone && _item_other.name ==  name{
		_qty += _item_other.qty;
	}
		
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
		
	//recreate inventory items
	
	//first destroy all non held inventory items
	with (obj_inventory_item) {
		if !selected {
			instance_destroy();	
		}
	}
		
	//regenerate inventory items
	obj_inventory_display.inventory_create_items();


}