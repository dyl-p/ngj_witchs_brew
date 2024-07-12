/// @description Insert description here
// You can write your code in this editor
//if player_has_item(item_name) {
//	return;
//}

if keyboard_check_pressed(ord("E")){
	item_add_inventory(item_name);
}else{
	obj_pickup_hint.is_show_requested = true;	
}