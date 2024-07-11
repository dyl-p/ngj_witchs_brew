/// @description Insert description here
// You can write your code in this editor

var _game = instance_find(obj_game,0);

if !delivered {
	with _game {
		money = money + other.val;	
	}

	delivered = true;
}


if list_pos != -1 {
	//show_debug_message(list_pos);
	ds_list_delete(obj_game.orders,list_pos);
}

instance_destroy(order);
instance_destroy();