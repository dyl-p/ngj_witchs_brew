/// @description Insert description here
// You can write your code in this editor

//if the item is being held
if selected {
	
	var _item_other = instance_place(x, y, obj_inventory_item);
	
	if !_item_other || _item_other.name == name {
		//check to see if there is a slot
		var _inst_slot = instance_position(mouse_x, mouse_y, obj_inventory_slot);
	
		drop_item(_inst_slot,1);
	}
}