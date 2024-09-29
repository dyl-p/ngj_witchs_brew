/// @description Insert description here
// You can write your code in this editor

//angle that the spoon will start at

angle_start = 15;
angle_apex = -1 * angle_start;
cauldron = noone;
dir_rot = 90;

spd_current = 0;
spd_max = 3;
spd_accel = 0.04;
spd_fric = 0.92;


boil_range_min = 420;
boil_range_max = 540;
boil_threshold = irandom_range(boil_range_min, boil_range_max);
boil_current = 0;

stir_setup = function(){
	angle_min = angle_start;
	image_angle = angle_min;
}

stir_setup();