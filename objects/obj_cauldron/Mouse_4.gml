/// @description Insert description here
// You can write your code in this editor

if brew_check_potion() {
	
	//add the potion to the users inventory
	brew_create_potion();
	ds_list_clear(brew);
	
	//recreate the inventory?
	
	instance_destroy(obj_inventory_item)
	obj_inventory_display.inventory_create_items();
}