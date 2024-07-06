// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function item_add(_name){
		
	var _array = obj_game.ingredients;
		
	for (var _i = 0; _i < array_length(_array); _i++) {
		if _array[_i][0] == _name {
			_array[_i][1] += 1;
			
			break;
		}
	}
}

function item_sprite(_name){
	
	switch (_name) {
	    case "lightning":
	        return spr_item_lightning;
	    default:
	        // code here
	        break;
	}
	
}