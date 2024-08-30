/// @description Insert description here
// You can write your code in this editor

//Get Input

var _input_left =  keyboard_check(ord("A"));
var _input_right = keyboard_check(ord("D"));
var _input_up = keyboard_check(ord("W"));
var _input_down = keyboard_check(ord("S"));

if path_position < 0.5 {
	image_angle = angle_min + (angle_apex * 2 * (path_position * 2));
} else {
	image_angle = angle_apex + (angle_min * 2 * ((path_position mod 0.5)* 2));	
}

var _input = false;

show_debug_message(path_position);

var _pos = path_position;

if _pos >= 0.9 || (0 <= _pos && _pos < 0.1) && _input_up{
	_input = true;
} else if 0.05 < _pos && _pos <= 0.45  && _input_right{
	_input = true;
} else if 0.4 < _pos && _pos <= 0.6  && _input_down{
	_input = true;
} else if 0.55 < _pos && _pos < 0.95  && _input_left{
	_input = true;
}

if _input {
	if spd_current <= 0.1 { spd_current = 0.5 };
	spd_current *= 1 + spd_accel;
	//show_debug_message("Oh yeah, got some input baby");
} else {
	spd_current *= spd_fric;
	//show_debug_message("Slowing Down");
}

if spd_current >= spd_max {
	spd_current = spd_max;
	//show_debug_message("Max speed bb");
}

if spd_current <= 0 {
	spd_current = 0;	
	//show_debug_message("Reset spoon speed to 0");
}

//show_debug_message(spd_current);

path_speed = spd_current;