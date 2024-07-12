// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function player_has_item(_name){
	return obj_game.ing_found[$ _name] == 1;	
}

function item_add(_name){
	obj_game.ing_found[$ _name] = 1;
}

function item_remove(_name){
	obj_game.ing_found[$ _name] = 0;
}

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