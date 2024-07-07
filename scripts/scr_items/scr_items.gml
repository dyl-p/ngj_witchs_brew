// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function item_add(_name){
		
	obj_game.ing_found[$ _name] = 1;
}

function item_sprite(_name){
	
	switch (_name) {
	    case "half_coffee":
	        return spr_half_coffee;
		case "owl_feather":
			return spr_owl_feather;
	    default:
	        // code here
	        break;
	}
	
}