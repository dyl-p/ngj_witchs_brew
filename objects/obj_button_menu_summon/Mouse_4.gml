/// @description Insert description here
// You can write your code in this editor

//only do things if the button is enabled
if !disable {
	var _order = []

	for (var _i = 0; _i < instance_number(obj_order); _i++;)
	{
	    var _inst = instance_find(obj_order, _i);
	
		if _inst.delivery_ready {
			obj_game.on_order_delivered(_inst);
		}
	}
	
	//obj_crow.call();

	// Inherit the parent event
	event_inherited();	
}