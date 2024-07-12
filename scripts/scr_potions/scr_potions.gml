// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

global.previous_orders = [];
global.previous_orders_to_maintain = 2;
function send_next_order(){	
	var _possible_orders = [
		new potion_talktocats(), 
		new potion_nightowl(),
		new potion_antidepressant(),
		new potion_hangovercure(),
		new potion_beautyfilter(),
		new potion_speedwalk(),
		new potion_rizz(),
	];
	for(var _i = 0; _i < array_length(global.previous_orders); _i++){
		array_delete(_possible_orders, 
			array_find_index(_possible_orders, method({_previous_order_i: _i}, function(_val, _ind){ 
				return _val.nm == global.previous_orders[_previous_order_i].nm; 
			}))
		, 1);	
	}
	array_shuffle_ext(_possible_orders);
	var _next_order = array_shift(_possible_orders);
	
	array_push(global.previous_orders, _next_order);
	if(array_length(global.previous_orders) > global.previous_orders_to_maintain){
		array_shift(global.previous_orders);	
	}
	
	ds_list_add(obj_game.orders, _next_order);	
}

function potion () constructor {
	nm="";
	ingredients=[];
	value = 0;
	spr = -1;
}

function potion_speedwalk (): potion () constructor {
	nm="Speedwalking"
	ingredients = ["banana", "glass_milk", "heartstone"];
	value = 105;
	spr = spr_potion_speedwalk;
}

function potion_rizz (): potion () constructor {
	nm="Instant Rizz";
	ingredients = ["heartstone", "gum", "rose"];
	value = 105;
	spr = spr_potion_rizzpotion;
}

function potion_talktocats (): potion () constructor {
	nm="Talk to Cats";
	ingredients = ["glass_milk", "cattail", "hairball"];
	value = 105;
	spr = spr_potion_speaktocats;
}

function potion_nightowl (): potion () constructor {
	nm="Night Owl";
	ingredients = ["half_coffee", "owl_feather"];
	value = 75;
	spr = spr_potion_nightowl;
}

function potion_antidepressant (): potion () constructor {
	nm="Antidepressant";
	ingredients = ["ash", "waterbottle", "bacon"];
	value = 99;
	spr = spr_potion_antidepressent;
}

function potion_hangovercure (): potion () constructor {
	nm="Hangover Cure";
	ingredients = ["waterbottle", "eyeofnewt", "bandaid"];
	value = 69;
	spr = spr_potion_antihangover;
}

function potion_beautyfilter (): potion () constructor {
	nm="Beauty Potion";
	ingredients = ["wine", "syringe", "pictureoftoad"];
	value = 128;
	spr = spr_potion_beautyfilter;
}