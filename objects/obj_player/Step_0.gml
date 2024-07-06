/// @description Insert description here
// You can write your code in this editor

#region movement

var _in_up = keyboard_check(ord("W"));
var _in_down = keyboard_check(ord("S"));
var _in_left = keyboard_check(ord("A"));
var _in_right = keyboard_check(ord("D"));

var _mv_x = 0;
var _mv_y = 0;

if _in_up || _in_down {
	_mv_y = _in_down - _in_up;
}

if _in_left || _in_right {
	_mv_x = _in_right - _in_left;
}

if ( _mv_x != 0 && _mv_y != 0 ) {
	_mv_x *= spd_angle * spd;
	_mv_y *= spd_angle * spd;
} else {
	_mv_x *= spd;
	_mv_y *= spd;	
}

#endregion

#region collision

if instance_place(x+ _mv_x, y + _mv_y, obj_collision){
		
} else {
	x += _mv_x;
	y += _mv_y;
}

#endregion