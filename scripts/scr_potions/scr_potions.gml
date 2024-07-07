// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// maintaining last order name so we dont send the same potion twice in a row 
global.last_order_name = "not a potion";
function send_next_order(){	
	// I know this is gross, sorry
	var new_order_nm = global.last_order_name;
	var new_order;
	while(new_order_nm == global.last_order_name){
		new_order = choose(
			new potion_talktocats(), 
			new potion_nightowl(),
			new potion_antidepressant(),
			new potion_hangovercure(),
			new potion_beautyfilter(),
		)	
		new_order_nm = new_order.nm;
	}
	ds_list_add(obj_game.orders, new_order);	
	global.last_order_name = new_order.nm;
}

function potion () constructor {
	nm="";
	ingredients=[];
	value = 0;
}

function potion_talktocats (): potion () constructor {
	nm="Talk to Cats"
	ingredients = ["glass_milk", "cattail", "hairball"];
	value = 105;
	spr = spr_speaktocatspotion;
}

function potion_nightowl (): potion () constructor {
	nm="Night Owl"
	ingredients = ["half_coffee", "owl_feather"];
	value = 75;
	spr = spr_nightowlpotion;
}

function potion_antidepressant (): potion () constructor {
	nm="Antidepressant"
	ingredients = ["ash", "waterbottle", "bacon"];
	value = 99;
	spr = spr_potion_antidepressent;
}

function potion_hangovercure (): potion () constructor {
	nm="Hangover Cure"
	ingredients = ["waterbottle", "eyeofnewt", "bandaid"];
	value = 69;
	spr = spr_potion_antihangover;
}

function potion_beautyfilter (): potion () constructor {
	nm="Beauty Potion"
	ingredients = ["wine", "syringe", "pictureoftoad"];
	value = 128;
	spr = spr_potion_beautyfilter;
}