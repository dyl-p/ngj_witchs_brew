/// @description Insert description here
// You can write your code in this editor
if room == rm_lose || room == rm_win {
	//show_debug_message("obj_game" destroyed)
	instance_destroy();
}


if room == Room1 {
	time--;
	if(is_fam_requested){
		is_fam_requested = false;
		instance_create_layer(-666, -666, "Instances_GUI",obj_crow);
	}
}

if time <= 0 {
	//game over stuff
	
	//lose rent money
	money -= rent_amount;
	
	if money < 0 {
		room_persistent = false;
		room_goto(rm_lose);
	}
	time = rent_due;
}

if !audio_is_playing(snd_potiondash_better_music){
	audio_play_sound(snd_potiondash_better_music,1, true);	
}