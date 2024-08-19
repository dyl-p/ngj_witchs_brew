/// @description Insert description here
// You can write your code in this editor

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
	_inst.list = obj_game.inventory;
	_inst.position = _i;
}

inventory_create_items = function(){

	//create the inventory items and place them per the inventory
	for (var _i = 0; _i < ds_list_size(obj_game.inventory); _i++) {
	
		var _row = _i mod max_col;
		var _col = _i div max_col;
	
		var _x = x + (offset * _row);		//set base x
		var _y = y + (offset * _col);		//set base y
	
	
		//create inventory objects if the spot isn't empty
		if obj_game.inventory[|_i] != -1 {
			instance_create_layer(_x, _y, "Instances", obj_inventory_item, obj_game.inventory[|_i]);
		}
	}
}

inventory_create_items();