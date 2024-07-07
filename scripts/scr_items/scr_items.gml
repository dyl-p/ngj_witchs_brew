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
	
	switch (_name) {
	    case "half_coffee":
	        return spr_coffee;
		case "owl_feather":
			return spr_owl_feather;
	    case "cattail":
	        return spr_cattails_menu;
		case "glass_milk":
			return spr_milk;
	    case "hairball":
	        return spr_hair_ball;
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
	    default:
	        // code here
	        break;
	}	
}