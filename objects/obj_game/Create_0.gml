/// @description Insert description here
// You can write your code in this editor

if instance_number(obj_game) > 1 {
	instance_destroy();	
}

//set randomness
randomize();

money = -666;
//30 days @ 15 seconds per day @ 60 frames per second
rent_due = 30 * 24 * 60;
time = rent_due;
rent_amount = 0;

is_fam_requested = false;

//list ingredients held
ing_found = {
	half_coffee: 0,
	owl_feather: 0,
	cattail: 0,
	hairball: 0,
	glass_milk: 0,
	ash: 0,
	bacon: 0,
	bandaid: 0,
	eyeofnewt: 0,
	pictureoftoad: 0,
	syringe: 0,
	waterbottle: 0,
	wine: 0,
	banana: 0,
	heartstone: 0,
	gum: 0,
	rose: 0,
	lucky_penny: 0,
};

//list orders taken
orders = ds_list_create();

//send first two orders
send_next_order();
send_next_order();

on_order_delivered = function(_order){
	money += _order.value;
	
	// remove order ingredients from inventory
	for (var i = 0; i < array_length(_order.ingredients); i += 1)
	{
	    item_remove(array_get(_order.ingredients, i));
	}
	
	// make sure we don't send the same potion again right away
	global.last_order_name = _order.nm;
	// remove completed order from list
	ds_list_delete(orders , ds_list_find_index(orders, _order.list_val));
	send_next_order()
	is_fam_requested = true;
}

room_persistent = true;
