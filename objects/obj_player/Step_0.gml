/// @description Insert description here
// You can write your code in this editor

depth = -y;

#region movement

var _in_up = keyboard_check(ord("W")) || gamepad_button_check(0, gp_padu);
var _in_down = keyboard_check(ord("S"))|| gamepad_button_check(0, gp_padd);
var _in_left = keyboard_check(ord("A"))|| gamepad_button_check(0, gp_padl);
var _in_right = keyboard_check(ord("D"))|| gamepad_button_check(0, gp_padr);

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
	if sign(_mv_x) > 0 {
		x = ceil(x);
		_mv_x = floor(_mv_x);
	} else {
		x = floor(x);
		_mv_x = ceil(_mv_x);		
	}
	
	if sign(_mv_y) > 0 {
		y = ceil(y);
		_mv_y = floor(_mv_y);
	} else {
		y = floor(y);
		_mv_y = ceil(_mv_y);		
	}

	var _x_sign = sign(_mv_x);
	var _y_sign = sign(_mv_y);
	
	while place_meeting(x + _mv_x, y, obj_collision){
		if _x_sign > 0 {
			_mv_x -= 1;	
		} else {
			_mv_x += 1;	
		}
		
		if _mv_x == 0 { break; }
	}
	
	while place_meeting(x, y + _mv_y, obj_collision){
		if _y_sign > 0 {
			_mv_y -= 1;	
		} else {
			_mv_y += 1;	
		}
		
		if _mv_y == 0 { break; }
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
		pickup.x = x - 
			(sprite_width / 2) - 
			(pickup.sprite_width / 2);
		pickup.y = y;
		break;
	case "right":
		sprite_index = spr_player_right;
		pickup.x = x + 
			abs((sprite_width / 2)) + 
			(pickup.sprite_width / 2);	
		pickup.y = y;
		break;
	case "up":
		sprite_index = spr_player_up;

		pickup.x = x;
		pickup.y = y - sprite_height;
		break;
	case "down":
		sprite_index = spr_player_down;
		pickup.x = x;
		pickup.y = y + pickup.sprite_height;
		break;
}

#endregion