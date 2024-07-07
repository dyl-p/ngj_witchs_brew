/// @description Insert description here
// You can write your code in this editor

draw_sprite(obj_game.orders[|list_pos].spr,0,x-60, y);
for (var _i = 0; _i < array_length(ingredients); _i++ ){
	draw_sprite(item_sprite(ingredients[_i]), 0, x + 60 + (60 * _i), y + 30);
}

draw_text(x + 360, y , value);


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
		var _del = instance_create_layer(x + 400, y, "Instances", obj_button_deliver);
		_del.text = "Deliver Potion";
		_del.list_pos = list_pos;
		_del.order = id;
		_del.val = value;
	}
	delivery_check_2 = true;
}