/// @description Insert description here
// You can write your code in this editor

depth = -y;

#region movement

<<<<<<< Updated upstream
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
			(sprite_width / 4) - 
			(pickup.sprite_width / 4);
		pickup.y = y;
		break;
	case "right":
		sprite_index = spr_player_right;
		pickup.x = x + 
			abs((sprite_width / 4)) + 
			(pickup.sprite_width / 4);	
		pickup.y = y;
		break;
	case "up":
		sprite_index = spr_player_up;

		pickup.x = x;
		pickup.y = y - ((1 * sprite_height)/2);
		break;
	case "down":
		sprite_index = spr_player_down;
		pickup.x = x;
		pickup.y = y + ((2*pickup.sprite_height)/3);
		break;
}

#endregion
=======
var _dir_x = _move_right - _move_left;
var _dir_y = _move_down - _move_up;

if _dir_x != 0 && _dir_y != 0 {
	_dir_x = _dir_x / sqrt(sqr(_dir_x) + sqr(_dir_y));	
	_dir_y = _dir_y / sqrt(sqr(_dir_x) + sqr(_dir_y));
}

//if we aren't moving stop animating
if _dir_x == 0 && _dir_y == 0 {
	image_speed = 0;
} else {
	image_speed = 1;
}

//set which sprite to use
if _move_up {
	sprite_index = spr_player_up;	
} else if _move_down {
	sprite_index = spr_player_down;
} else if _move_right {
	sprite_index = spr_player_right;
} else {
	sprite_index = spr_player;	
}

//do the movement
move_and_collide(_dir_x*(my_speed_max), _dir_y*(my_speed_max),obj_collision);



#region camera
	//camera_set_view_pos(view_camera[0], x - (camera_get_view_width(view_camera[0]) / 2), y - (camera_get_view_height(view_camera[0]) / 2));
#endregion

depth = -y;
>>>>>>> Stashed changes
