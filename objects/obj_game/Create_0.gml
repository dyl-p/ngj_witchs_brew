/// @description Insert description here
// You can write your code in this editor


/* 
user events:
0 - order delivered
1 - ingredient picked up
*/


//if instance_number(obj_game) > 1 {
//	instance_destroy();	
//}
//set randomness
randomize();

money = 0;

//30 days @ 15 seconds per day @ 60 frames per second
rent_due = 30 * 24 * 60;
time = rent_due;
rent_amount = 350;

//list ingredients held
ing_found = {
	half_coffee: 0,
	owl_feather: 0,
	cattail: 0,
	hairball: 0,
	glass_milk: 0
};

//list orders taken
orders = ds_list_create();

//testing add two potions to order
//scr_add_potion(orders);
//scr_add_potion(orders);

ds_list_add(orders, new cat()  );
ds_list_add(orders, new owl()  );

on_order_delivered = function(_order){
	money += _order.value;
	
	if money >= rent_amount {
		// woohoo you made rent!
		room_persistent = false;
		room_goto(rm_win);	
	}
}

room_persistent = true;