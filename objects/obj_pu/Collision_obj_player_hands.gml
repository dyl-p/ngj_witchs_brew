/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(ord("E")) && !player_has_item(item_name){
	
	//add the item to the player's inventory
	item_add(item_name);
	
	var _inst = instance_create_layer(-10, -10 , "Instances_GUI",obj_pickup_ind);
	_inst.item_name = item_name;
	
	//delete the object
	//instance_destroy();
}