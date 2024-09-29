/// @description Insert description here
// You can write your code in this editor

//Get Input
var _input_left =  keyboard_check(ord("A"));
var _input_right = keyboard_check(ord("D"));
var _input_up = keyboard_check(ord("W"));
var _input_down = keyboard_check(ord("S"));

var _input_ing = keyboard_check_pressed(vk_space);

//determine angle of sprite
if path_position < 0.5 {
	image_angle = angle_min + (angle_apex * 2 * (path_position * 2));
} else {
	image_angle = angle_apex + (angle_min * 2 * ((path_position mod 0.5)* 2));	
}

//setup for moving the spoon
var _input = false;

var _pos = path_position;

//figure out if the input is appropriate for where in the pot we're stirring


if _pos >= 0.9 || (0 <= _pos && _pos < 0.1) && _input_up{
	_input = true;

} else if 0.55 < _pos && _pos < 0.95  && _input_left{
	_input = true;

} else if 0.4 < _pos && _pos <= 0.6  && _input_down{
	_input = true;

} else if 0.05 < _pos && _pos <= 0.45  && _input_right{
	_input = true;

}

if _pos >= 0.9 || (0 <= _pos && _pos < 0.05){

	dir_rot = 90;
} else if 0.55 <= _pos && _pos < 0.9{

	dir_rot = 180;
} else if 0.4 < _pos && _pos <= 0.55{

	dir_rot = 270;
} else if 0.05 < _pos && _pos <= 0.4{

	dir_rot = 0;
}

//if we are pressing the right input increase speed of stirring
if _input {
	if spd_current <= 0.1 { spd_current = 0.5 };
	spd_current *= 1 + spd_accel;
//if we aren't pressing the right input slow down
} else {
	spd_current *= spd_fric;
}

//cap speed of spoon
if spd_current >= spd_max {
	spd_current = spd_max;
}

//don't let the speed become negative
if spd_current <= 0 {
	spd_current = 0;	
}

//set speed
path_speed = spd_current;

/*change colour of sprite based on how boiling the brew is*/

if spd_current >= 1 {
	boil_current += (0.2 + (1 - (spd_current / spd_max)));
} else {
	boil_current += 1;
}



if _input_ing {
	boil_current = 0;	
}