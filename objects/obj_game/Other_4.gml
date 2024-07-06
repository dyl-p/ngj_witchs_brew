/// @description Insert description here
// You can write your code in this editor

if room_get_name(room) == "rm_orders" {

	for (var _i = 0; _i < ds_list_size(orders); _i ++ ){
		var _inst = instance_create_layer(room_width / 3, room_width / 5 + (_i * 120), "Instances",obj_order);
		_inst.name = orders[|_i].name;
		_inst.ingredients = orders[|_i].ingredients;
		_inst.value = orders[|_i].value;
		_inst.list_pos = _i;
	}
}