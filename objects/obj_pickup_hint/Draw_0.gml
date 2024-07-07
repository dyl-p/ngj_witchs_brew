/// @description Insert description here
// You can write your code in this editor

//move this object with the camera
x = (view_get_wport(0) / 2) + camera_get_view_x(view_camera[0]);
y = 800 + camera_get_view_y(view_camera[0])

if(is_show_requested){
	is_show_requested = false; // will be reset on every pickup collision event
	
	var _text = "Press E to Collect Ingredient"
	var _text_w = string_width(_text);

	var _x_scale = _text_w / sprite_width;

	draw_set_halign(fa_center);
	draw_text_color(x, y, _text, c_white, c_white, c_white, c_white, 1);
}
