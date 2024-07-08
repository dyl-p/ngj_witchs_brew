/// @description Insert description here
// You can write your code in this editor
if(room != Room1){
	return;	
}

var _from_x = obj_player.x - 600;//(view_get_wport(0) / 2) - 500;
var _to_x = obj_player.x + 600;//(view_get_wport(0) / 2) + 500;
var _animation_progress = (current_time - call_started_at) / call_animation_duration;
var _dip_y = 300;

show_debug_message(_animation_progress)
y = obj_player.y - _dip_y + cos((_animation_progress - 0.5)) * _dip_y;//camera_get_view_y(view_camera[0]);
x = lerp(_from_x, _to_x, _animation_progress);