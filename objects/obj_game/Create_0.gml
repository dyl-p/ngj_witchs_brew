/// @description Insert description here
// You can write your code in this editor


//if instance_number(obj_game) > 1 {
//	instance_destroy();	
//}
//set randomness
randomize();

//list ingredients held
ingredients = [
	["lightning", 0],
	["polaroid", 0],
	["heartstone", 0]
];

//list orders taken
orders = ds_list_create();

//testing add two potions to order
scr_add_potion(orders);
scr_add_potion(orders);

show_debug_message(orders[|0].name);
show_debug_message(orders[|1].name);

//create buttons for main room

btn_order = instance_create_layer(0,0,"Instances_GUI", obj_button);