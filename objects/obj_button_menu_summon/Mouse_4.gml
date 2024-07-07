/// @description Insert description here
// You can write your code in this editor

//only do things if the button is enabled
if !disable {

	var _order = []

	for (var _i = 0; _i < instance_number(obj_order); _i++;)
	{
	    var _inst =  instance_find(obj_order, _i);
	
		if _inst.delivery_ready {
			ds_list_delete(obj_game.orders , ds_list_find_index(obj_game.orders, _inst.list_val));
			show_debug_message(_inst.list_pos);
			obj_game.on_order_delivered(_inst);
		}
	
	}

	// Inherit the parent event
	event_inherited();

}