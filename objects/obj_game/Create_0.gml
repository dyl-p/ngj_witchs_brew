/// @description Insert description here
// You can write your code in this editor


//if instance_number(obj_game) > 1 {
//	instance_destroy();	
//}
//set randomness
randomize();

money = 0;

//30 days @ 15 seconds per day @ 60 frames per second
rent_due = 30 * 0.5 * 60;
time = rent_due;
rent_amount = 350;

//list ingredients held
ing_found = {
	lightning: 1,
	cat_black: 0,
	flower: 0,
	grass: 1
};

//list orders taken
orders = ds_list_create();

//testing add two potions to order
scr_add_potion(orders);
scr_add_potion(orders);

show_debug_message(orders[|0].name);

//create buttons for main room

btn_order = instance_create_layer(0,0,"Instances_GUI", obj_button);

room_persistent = true;