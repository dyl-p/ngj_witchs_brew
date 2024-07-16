/// @description Insert description here
// You can write your code in this editor

//x = 120;
//y = 120;

max_col = 6;
max_row = 3;

//create the inventory items
for (var _i = 0; _i < ds_list_size(obj_game.inventory); _i++) {
	
	var _row = _i mod max_col;
	var _col = _i div max_col;
	
	var _x = x + (120 * _row);		//set base x
	var _y = y + (120 * _col);		//set base y
	
	//draw the items and number of items
	//draw_sprite(obj_game.inventory[|_i].spr,0, _x, _y);
	//draw_text(_x, _y, obj_game.inventory[|_i].qty);
	
	//create inventory objects
	instance_create_layer(_x, _y, "Instances", obj_inventory_item, obj_game.inventory[|_i]);
}