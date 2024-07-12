/// @description Insert description here
// You can write your code in this editor
#region input mapping

var _move_up = keyboard_check(ord("W")) || gamepad_button_check(0, gp_padu);
var _move_down = keyboard_check(ord("S"))|| gamepad_button_check(0, gp_padd);
var _move_left = keyboard_check(ord("A"))|| gamepad_button_check(0, gp_padl);
var _move_right = keyboard_check(ord("D"))|| gamepad_button_check(0, gp_padr);

#endregion

#region accelerated joystick based movement

if ( _move_right || _move_left || _move_up || _move_down ) {
	
	var _dir_x = _move_right - _move_left;
	var _dir_y = _move_down - _move_up;
	var _dir_angle = point_direction(x, y, x + _dir_x, y + _dir_y);
	//show_debug_message(_dir_angle);

	
	var _dir_diff = angle_difference(_dir_angle, image_angle);
	
	direction = _dir_angle;
	
	my_speed = my_speed_max;
	
	
	//movement with acceleration
	/*
	if my_speed == 0 {
		my_speed = my_speed_start;	
	}
	
	my_speed *= my_acceleration;
	
	if my_speed > my_speed_max {
		my_speed = my_speed_max;	
	}
	*/
	
	//change direction of sprite based on direction of movement
	//if direction > 90 && direction < 270 {
	//	image_xscale = -1;
	//} else {
	//	image_xscale = 1;	
	//}

} else {
	my_speed *= my_friction;
	
	//my_speed = 0
	
	if my_speed < 0 {
		my_speed = 0;
	}
}
#endregion

#region collision

//check collision or move
if (place_meeting(x + lengthdir_x(my_speed, direction), y + lengthdir_y(my_speed, direction), obj_collision)){
	
	//get x and y values of where we would place the character
	var _x = x + lengthdir_x(my_speed, direction);
	
	
	// if we're heading right
	if (0 <= direction && direction < 90) || (270 < direction && direction <= 360) {

		//set the next move x to the highest value
		_x = ceil(_x);
		
		//work backwards until we don't have a collision anymore
		while place_meeting(_x, y, obj_collision) {
			_x--;
		}

	//if we're heading left
	} else {
		
		//set the next x value to the lowest (furthest away) value
		_x = floor(_x);
		
		//work backwards until there isn't a collision anymore
		while place_meeting(_x, y, obj_collision) {
			_x++;
		}
	}
	
	var _y = y + lengthdir_y(my_speed, direction);
	
	//if we're heading down
	if (180 < direction && direction < 360) {

		_y = ceil(_y);
		
		while place_meeting(_x, _y, obj_collision) {
			_y--;
		}
		
	//if we're heading up
	} else {

		_y = floor(_y);
		
		while place_meeting(_x, _y, obj_collision) {
			_y++;
		}	
	}

	//set new x and y values
	x = _x;
	y = _y;

	//set speed to zero
	my_speed = 0;

} else {
	//if there wasn't a collision move!
	x = x + lengthdir_x(my_speed, direction);
	y = y + lengthdir_y(my_speed, direction);
}
#endregion

if instance_exists(my_pickup) {

	my_pickup.y = y;
	my_pickup.x = x;
	
	var _pickup_offset = 0;

	if 45 <= direction && direction <= 135 {
		my_pickup.y = y - (my_pickup_dist_v) + 20;
		sprite_index = spr_player_up;
	} else if 135 < direction && direction < 225 {
		my_pickup.x = x - my_pickup_dist_h + _pickup_offset;
		sprite_index = spr_player;
	} else if 225 <= direction && direction <= 315{
		my_pickup.y = y + my_pickup_dist_v + 30;
		sprite_index = spr_player_down;
	} else {
		my_pickup.x = x + my_pickup_dist_h - _pickup_offset;	
		sprite_index = spr_player_right;
	}

	if my_speed < my_speed_start {
		image_speed = 0;	
	} else {
		image_speed = 1;	
	}
}
	
depth = -y;

#region camera
	//camera_set_view_pos(view_camera[0], x - (camera_get_view_width(view_camera[0]) / 2), y - (camera_get_view_height(view_camera[0]) / 2));
#endregion

//show_debug_message("Player V: (" + string(x) + ", " + string(y) + ")");

//var _baby_held = instance_nearest(x, y, obj_baby).being_held;

//if my_speed == 0 {
//	if _baby_held {
//		sprite_index = spr_player_beb_idle;	
//	} else {
//		sprite_index = spr_player_idle;
//	}
//} else {
//	if _baby_held {
//		sprite_index = spr_player_beb;	
//	} else {
//		sprite_index = spr_player_run;
//	}
//}