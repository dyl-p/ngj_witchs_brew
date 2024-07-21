/// @description Insert description here
// You can write your code in this editor

//x = 120;
//y = 120;

max_col = obj_game.max_inv_col;
max_row = obj_game.max_inv_row;
offset = 92;

//create the inventory slots
for (var _i = 0; _i < (max_col * max_row); _i++) {
	var _row = _i mod max_col;
	var _col = _i div max_col;
	
	var _x = x + (offset * _row);		//set base x
	var _y = y + (offset * _col);		//set base y
	
	var _inst = instance_create_depth(_x, _y, 0, obj_inventory_slot);
	_inst.position = _i;
}

//create the inventory items
for (var _i = 0; _i < ds_list_size(obj_game.inventory); _i++) {
	
	var _row = _i mod max_col;
	var _col = _i div max_col;
	
	var _x = x + (offset * _row);		//set base x
	var _y = y + (offset * _col);		//set base y
	
	//draw the items and number of items
	//draw_sprite(obj_game.inventory[|_i].spr,0, _x, _y);
	//draw_text(_x, _y, obj_game.inventory[|_i].qty);
	
	//create inventory objects if the spot isn't empty
	if obj_game.inventory[|_i] != -1 {
		instance_create_layer(_x, _y, "Instances", obj_inventory_item, obj_game.inventory[|_i]);
	}
}