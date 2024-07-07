// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_add_potion(_list){

	//add to ds_list
	ds_list_add(_list, choose(new cat(), new owl() ));
}

function potion () constructor {
	name="";
	ingredients=[];
	value = 0;
}

function cat (): potion () constructor {
	name="Talk to Cats"
	ingredients = ["glass_milk", "cattail", "hairball"];
	value = 250;
	spr = spr_speaktocatspotion;
}

function owl (): potion () constructor {
	name="Night Owl"
	ingredients = ["half_coffee", "owl_feather"];
	value = 250;
	spr = spr_nightowlpotion;
}