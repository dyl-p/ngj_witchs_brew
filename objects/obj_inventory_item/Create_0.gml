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