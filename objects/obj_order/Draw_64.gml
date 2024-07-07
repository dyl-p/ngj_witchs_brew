/// @description Insert description here
// You can write your code in this editor

//draw potion and name
draw_sprite(obj_game.orders[|list_pos].spr, 0, x - 30, y-30);

var _save_font = draw_get_font();
draw_set_font(fnt_menu_small);
draw_text(x-30, y + 40,nm);
draw_set_font(_save_font);

//draw potion ingredients
for (var _i = 0; _i < array_length(ingredients); _i++ ){
	var _alpha = 1;
	
	draw_sprite(spr_checkbox, 0, x + 175 + (167*_i), y - 18);
	
	if obj_game.ing_found[$ ingredients[_i]] = 0 {
		_alpha = 0.5;
	} else {
		draw_sprite_ext(spr_checkmark, 0, x + 175 + (167*_i), y - 40, 0.7, 0.7, 0,c_white,1);	
	}
	
	draw_sprite_ext(item_sprite(ingredients[_i]), 0, x + 131 + (167 * _i), y + 30, 1, 1, 0, c_white,_alpha);
	
}

var _ready = 0;

//check to see if we can complete this order
if !delivery_check {
	for (var _i =0; _i < array_length(ingredients); _i++){
		var _ing = ingredients[_i];
		_ready += obj_game.ing_found[$ _ing];
	}
}

if !delivery_check_2 {
	if _ready == array_length(ingredients) {
		delivery_ready = true;
	
	}
	delivery_check_2 = true;
}

if delivery_ready {
	draw_sprite(spr_checkmark, 0, x + 630, y);	
}