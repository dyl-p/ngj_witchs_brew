/// @description Insert description here
// You can write your code in this editor

depth = -y;

item_name = "lightning";

pick_up = function(){
	//add the item to the player's inventory
	item_add(item_name);
	audio_play_sound(snd_pickup,1, false);
	
	var _inst = instance_create_layer(-10, -10 , "Instances_GUI",obj_pickup_ind);
	_inst.item_name = item_name;	
}