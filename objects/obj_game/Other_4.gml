/// @description Insert description here
// You can write your code in this editor

if room_get_name(room) == "rm_orders" {

	for (var _i = 0; _i < ds_list_size(orders); _i ++ ){
		var _inst = instance_create_layer(500, 100 + (_i * 240), "Instances",obj_order);
		_inst.name = orders[|_i].name;
		_inst.ingredients = orders[|_i].ingredients;
		_inst.value = orders[|_i].value;
		_inst.list_pos = _i;
	}
}