/// @description Insert description here
// You can write your code in this editor

call_started_at = current_time;
call_animation_duration = 1500;
already_touched_player = false;
image_xscale = -1;
sprite_index = spr_crowcashin

on_touched_player = function(){
	if(already_touched_player){
		return;
	}
	
	image_xscale = 1;
	sprite_index = spr_crowtakeout
	
	already_touched_player = true;
	
	// do stuff
}