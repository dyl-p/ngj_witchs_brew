/// @description Insert description here
// You can write your code in this editor

depth = -y;

#region movement

var _in_up = keyboard_check(ord("W"));
var _in_down = keyboard_check(ord("S"));
var _in_left = keyboard_check(ord("A"));
var _in_right = keyboard_check(ord("D"));

var _mv_x = 0;
var _mv_y = 0;

if _in_left || _in_right {
	_mv_x = _in_right - _in_left;
	if _mv_x < 0 {
		dir = "left";
	} else if _mv_x > 0 {
		dir = "right";	
	}
}
if _in_up || _in_down {
	_mv_y = _in_down - _in_up;
	if _mv_y < 0 {
		dir = "up";
	} else if _mv_y > 0 {
		dir = "down";	
	}
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

if place_meeting(x+ _mv_x, y + _mv_y, obj_collision){
	
	//make the character's x, y integer values
	
	
	while place_meeting(x + _mv_x, y, obj_collision){
		if sign(_mv_x) > 0 {
			x = floor(x);
			_mv_x = ceil(_mv_x);
		} else {
			x = ceil(x);
			_mv_x = floor(_mv_x);		
		}
		
		_mv_x = sign(_mv_x) * (abs(_mv_x) - 1);
	}
	
	while place_meeting(x, y + _mv_y, obj_collision){
		if sign(_mv_y) > 0 {
			y = floor(y);
			_mv_y = ceil(_mv_y);
		} else {
			y = ceil(y);
			_mv_y = floor(_mv_y);		
		}
		
		_mv_y = sign(_mv_y) * (abs(_mv_y) - 1);
	}
} 

x += _mv_x;
y += _mv_y;

#endregion

#region set sprite

if _mv_x == 0 && _mv_y == 0 {
	image_speed = 0;	
} else {
	image_speed = 1;
}	

switch (dir) {
	case "left":
		sprite_index = spr_player;
		image_xscale = 1;
		pickup.x = x - 
			(sprite_width / 2) - 
			(pickup.sprite_width / 2);
		pickup.y = y;
		break;
	case "right":
		sprite_index = spr_player;
		image_xscale = -1;
		pickup.x = x + 
			abs((sprite_width / 2)) + 
			(pickup.sprite_width / 2);	
		pickup.y = y;
		break;
	case "up":
		sprite_index = spr_player_up;
		image_xscale = 1;
		pickup.x = x;
		pickup.y = y - sprite_height;
		break;
	case "down":
		sprite_index = spr_player_down;
		image_xscale = 1;
		pickup.x = x;
		pickup.y = y + pickup.sprite_height;
		break;
}

#endregion