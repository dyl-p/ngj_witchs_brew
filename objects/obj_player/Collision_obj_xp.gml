/// @description Insert description here
// You can write your code in this editor

var _baby = instance_nearest(x, y, obj_baby);

if _baby.being_held == false {
	_baby.xp += 100;
	instance_destroy(other);
	
	audio_play_sound(sfx_pickup, 1, 0);
}

