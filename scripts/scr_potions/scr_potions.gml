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
	inv_loc = -1;
	type = "potion"; //used to identify between different types of things in the inventory
	qty = 1;
}

function potion_speedwalk (): potion () constructor {
	nm="Speedwalking"
	ingredients = ["banana", "glass_milk", "heartstone"];
	value = 105;
	spr = spr_potion_speedwalk_icon;
}

function potion_rizz (): potion () constructor {
	nm="Instant Rizz";
	ingredients = ["heartstone", "gum", "rose"];
	value = 105;
	spr = spr_potion_rizzpotion_icon;
}

function potion_talktocats (): potion () constructor {
	nm="Talk to Cats";
	ingredients = ["glass_milk", "cattail", "hairball"];
	value = 105;
	spr = spr_potion_speaktocats_icon;
}

function potion_nightowl (): potion () constructor {
	nm="Night Owl";
	ingredients = ["half_coffee", "owl_feather"];
	value = 75;
	spr = spr_potion_nightowl_icon;
}

function potion_antidepressant (): potion () constructor {
	nm="Antidepressant";
	ingredients = ["ash", "waterbottle", "bacon"];
	value = 99;
	spr = spr_potion_antidepressent_icon;
}

function potion_hangovercure (): potion () constructor {
	nm="Hangover Cure";
	ingredients = ["waterbottle", "eyeofnewt", "bandaid"];
	value = 69;
	spr = spr_potion_antihangover_icon;
}

function potion_beautyfilter (): potion () constructor {
	nm="Beauty Potion";
	ingredients = ["wine", "syringe", "pictureoftoad"];
	value = 128;
	spr = spr_potion_beautyfilter_icon;
}

//returns all potions structs
//used for evaluating if the brew is accurate or not
function get_potions_all(){
	var _potions = [];
	
	array_push(_potions, potion_get_struct("Speedwalking"));
	array_push(_potions, potion_get_struct("Instant Rizz"));
	array_push(_potions, potion_get_struct("Talk to Cats"));
	array_push(_potions, potion_get_struct("Night Owl"));
	array_push(_potions, potion_get_struct("Antidepressant"));
	array_push(_potions, potion_get_struct("Hangover Cure"));	
	array_push(_potions, potion_get_struct("Beauty Potion"));
	
	return _potions;
}

function potion_get_struct(_name){
	switch (_name) {
	    case "Speedwalking":
	        return new potion_speedwalk();
		case "Instant Rizz":
			return new potion_rizz();
	    case "Talk to Cats":
	        return new potion_talktocats();
		case "Night Owl":
			return new potion_nightowl();
	    case "Antidepressant":
	        return new potion_antidepressant();
		case "Hangover Cure":
			return new potion_hangovercure();
		case "Beauty Potion":
			return new potion_beautyfilter();
	    default:
	        return noone;
	}	
}

//add a struct to the inventory
function potion_add_inventory(_name){
	
	//check to see if the item already exists
	var _item_added = false;
	
	for (var _i = 0; _i < ds_list_size(obj_game.inventory); _i++) {
		
		//check to see if the current space has an inventory item
		if obj_game.inventory[|_i] != -1 {
			if obj_game.inventory[| _i].nm	== _name {
				//check to see if we've reached the max stack size

				obj_game.inventory[| _i].qty += 1;
			
				_item_added = true;
			}
		}
	}
	
	//if the item doesn't exist on the list create a new one!
	if !_item_added {
		
		//the inventory is prepolated with -1 so you have to 
		//use the replace function to keep the list size
		for (var _i = 0; _i < ds_list_size(obj_game.inventory); _i++) {
			if obj_game.inventory[|_i] == -1 {
				ds_list_replace(obj_game.inventory, _i,potion_get_struct(_name));
				break;
			}
		}
	}
}