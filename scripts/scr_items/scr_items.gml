// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function item_add(_name){
		
	obj_game.ing_found[$ _name] = 1;
}

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
	    default:
	        // code here
	        break;
	}
	
}