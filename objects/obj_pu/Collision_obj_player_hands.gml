/// @description Insert description here
// You can write your code in this editor
if player_has_item(item_name) {
	return;
}

if keyboard_check_pressed(ord("E")){
	//add the item to the player's inventory
	item_add(item_name);
	audio_play_sound(snd_pickup,1, false);
	
	var _inst = instance_create_layer(-10, -10 , "Instances_GUI",obj_pickup_ind);
	_inst.item_name = item_name;
}else{
	obj_pickup_hint.is_show_requested = true;	
}