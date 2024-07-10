/// @description Insert description here
// You can write your code in this editor

if room_get_name(room) == "rm_orders" {

	for (var _i = 0; _i < ds_list_size(orders); _i ++ ){
		var _inst = instance_create_layer(room_width / 3, (room_height / 2) -40 + (_i * 150), "Objects",obj_order);
		_inst.nm = orders[|_i].nm;
		_inst.ingredients = orders[|_i].ingredients;
		_inst.value = orders[|_i].value;
		_inst.list_pos = _i;
		_inst.list_val = ds_list_find_value(orders, _i);
	}
}

//if we've won or lost destory this object so it gets created again if the player restarts
if room == rm_win || room == rm_lose{
	instance_destroy();
}