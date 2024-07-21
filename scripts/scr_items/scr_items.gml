// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//function player_has_item(_name){
//	return obj_game.ing_found[$ _name] == 1;	
//}

function item_add(_name){
	obj_game.ing_found[$ _name] = 1;
}

function item_remove(_name){
	obj_game.ing_found[$ _name] = 0;
}

//add a struct to the inventory
function item_add_inventory(_name){
	
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
				ds_list_replace(obj_game.inventory, _i,item_get_struct(_name));
				break;
			}
		}
	}
}

function item_get_struct(_name){
	switch (_name) {
	    case "half_coffee":
	        return new item_half_coffee();
		case "owl_feather":
			return new item_owl_feather();
	    case "cattail":
	        return new item_cattail();
		case "glass_milk":
			return new item_glass_milk();
	    case "hairball":
	        return new item_hairball();
		case "ash":
			return new item_ash();
		case "bacon":
			return new item_bacon();
		case "bandaid":
			return new item_bandaid();
		case "eyeofnewt":
			return new item_eyeofnewt();
		case "pictureoftoad":
			return new item_pictureoftoad();
		case "syringe":
			return new item_syringe();
		case "waterbottle":
			return new item_waterbottle();
		case "wine":
			return new item_wine();
		case "heartstone":
			return new item_heartstone();
		case "gum":
			return new item_gum();
		case "rose":
			return new item_rose();
		case "banana":
			return new item_banana();
	    default:
	        return noone;
	}	
}

function item () constructor {
	nm="";				//name of item
	desc = "";			//description of item
	sprite = noone;		//sprite of item
	qty = 1;			//quantity of item
	inv_loc = -1;
	type = "item";		//used to identify between different types of things in the inventory
}

function item_half_coffee (): item () constructor {
	nm="half_coffee";
	desc = "half a coffee";
	spr = spr_coffee;
}

function item_owl_feather (): item () constructor {
	nm="owl_feather";
	desc = "an owl's feather";
	spr = spr_icon_owl_feather;
}

function item_cattail (): item () constructor {
	nm="cattail";
	desc = "a cattail";
	spr = spr_icon_cattails;
}

function item_glass_milk (): item () constructor {
	nm="glass_milk";
	desc = "a partially drunk glass of milk";
	spr = spr_icon_milk;
}

function item_hairball (): item () constructor {
	nm="hairball";
	desc = "a coughed up hairball";
	spr = spr_icon_hairball;
}

function item_ash (): item () constructor {
	nm="ash";
	desc = "a pile of cigarette ash";
	spr = spr_icon_ash;
}

function item_bacon (): item () constructor {
	nm="bacon";
	desc = "delicious bacon :)";
	spr = spr_icon_bacon;
}

function item_bandaid (): item () constructor {
	nm="bandaid";
	desc = "a gross used bandaid";
	spr = spr_bandaid;
}

function item_eyeofnewt (): item () constructor {
	nm="eyeofnewt";
	desc = "an eye of newt";
	spr = spr_icon_eyeofnewt;
}

function item_pictureoftoad (): item () constructor {
	nm="pictureoftoad";
	desc = "a picture of a toad";
	spr = spr_icon_pictureoftoad;
}

function item_syringe (): item () constructor {
	nm="syringe";
	desc = "a syringe, be careful!";
	spr = spr_icon_syringe;
}

function item_waterbottle (): item () constructor {
	nm="waterbottle";
	desc = "a bottle of fizzy water";
	spr = spr_icon_waterbottle;
}

function item_wine (): item () constructor {
	nm="wine";
	desc = "someone's abandoned wine glass";
	spr = spr_icon_wine_glass;
}

function item_heartstone (): item () constructor {
	nm="heartstone";
	desc = "a heartstone from the mountain";
	spr = spr_icon_heartstone;
}

function item_gum (): item () constructor {
	nm="gum";
	desc = "previously enjoyed gum";
	spr = spr_icon_gum;
}

function item_rose (): item () constructor {
	nm="rose";
	desc = "a beautiful rose";
	spr = spr_icon_rose;
}

function item_banana (): item () constructor {
	nm="banana";
	desc = "a slippery banana peel";
	spr = spr_icon_banana;
}

function item_sprite(_name){
	var _struct = item_get_struct(_name);
	
	return _struct.spr;
}

function item_desc(_name) {
	var _struct = item_get_struct(_name);
	
	return _struct.desc;
}

/*
//based on the item name get it's sprite!
function item_sprite(_name){
	//show_debug_message(_name);
	switch (_name) {
	    case "half_coffee":
	        return spr_coffee;
		case "owl_feather":
			return spr_icon_owl_feather;
	    case "cattail":
	        return spr_icon_cattails;
		case "glass_milk":
			return spr_icon_milk;
	    case "hairball":
	        return spr_icon_hairball;
		case "ash":
			return spr_icon_ash;
		case "bacon":
			return spr_icon_bacon;
		case "bandaid":
			return spr_icon_bandaid;
		case "eyeofnewt":
			return spr_icon_eyeofnewt;
		case "pictureoftoad":
			return spr_icon_pictureoftoad;
		case "syringe":
			return spr_icon_synringe;
		case "waterbottle":
			return spr_icon_waterbottle;
		case "wine":
			return spr_icon_wine_glass;
		case "heartstone":
			return spr_icon_heartstone;
		case "gum":
			return spr_icon_gum;
		case "rose":
			return spr_icon_rose;
		case "banana":
			return spr_icon_banana;
	    default:
	        // code here
	        break;
	}	
}

//based on the item name get it's description!
function item_desc(_name){
	
	switch (_name) {
	    case "half_coffee":
	        return "half a coffee";
		case "owl_feather":
			return "an owl's feather";
	    case "cattail":
	        return "a cattail";
		case "glass_milk":
			return "a partially drunk glass of milk";
	    case "hairball":
	        return "a coughed up hairball";
		case "ash":
			return "a pile of cigarette ash";
		case "bacon":
			return "delicious bacon :)";
		case "bandaid":
			return "a gross used bandaid";
		case "eyeofnewt":
			return "an eye of newt";
		case "pictureoftoad":
			return "a picture of a toad";
		case "syringe":
			return "a syringe, be careful!";
		case "waterbottle":
			return "a bottle of fizzy water";
		case "wine":
			return "someone's abandoned wine glass";
		case "heartstone":
			return "a heartstone from the mountain";
		case "gum":
			return "previously enjoyed gum";
		case "rose":
			return "a beautiful rose";
		case "banana":
			return "a slippery banana peel";
	    default:
	        // code here
	        break;
	}	
}
*/