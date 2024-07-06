/// @description Insert description here
// You can write your code in this editor

draw_text(x, y, name);
for (var _i = 0; _i < array_length(ingredients); _i++ ){
	draw_text(x + (_i * 90), y+60, ingredients[_i]);	
}
draw_text(x, y + 120, value);


var _ready = 0;

//check to see if we can complete this order
if !delivery_check {
	for (var _i =0; _i < array_length(ingredients); _i++){
		var _ing = ingredients[_i];
		_ready += obj_game.ing_found[$ _ing];
	}
}

if _ready == array_length(ingredients) {
	delivery_ready = true;
	var _del = instance_create_layer(x, y + 120, "Instances", obj_button_deliver);
	_del.text = "Deliver Potion";
	_del.list_pos = list_pos;
	_del.order = id;
	_del.value = value;
}