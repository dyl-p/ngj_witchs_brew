/// @description Insert description here
// You can write your code in this editor

obj_game.money += value;

if list_pos != -1 {
	show_debug_message(list_pos);
	ds_list_delete(obj_game.orders,list_pos);
}

instance_destroy(order);
instance_destroy();