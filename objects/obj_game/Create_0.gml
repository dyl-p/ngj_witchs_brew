/// @description Insert description here
// You can write your code in this editor


//if instance_number(obj_game) > 1 {
//	instance_destroy();	
//}
//set randomness
randomize();

money = 0;

//30 days @ 15 seconds per day @ 60 frames per second
rent_due = 30 * 0.2 * 60;
time = rent_due;
rent_amount = 350;

//list ingredients held
ing_found = {
	half_coffee: 1,
	owl_feather: 1,
	cattail: 1,
	hairball: 1,
	glass_milk: 1
};

/*
owl feather (from the owl in the tree in the pond)
half empty coffee (from downtown)
 (edited)
[10:01 AM]
talk to cats potion:
cat tails (from the cat tails in the pond)
hairball (from the cat downtown)
glass of milk (from the cow in the commune)
*/

//list orders taken
orders = ds_list_create();

//testing add two potions to order
//scr_add_potion(orders);
//scr_add_potion(orders);

ds_list_add(orders, new cat()  );
ds_list_add(orders, new owl()  );

//show_debug_message(orders[|0].name);

//create buttons for main room

btn_order = instance_create_layer(0,0,"Instances_GUI", obj_button);

room_persistent = true;