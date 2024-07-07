/// @description Insert description here
// You can write your code in this editor

//move this object with the camera
x = (view_get_wport(0) / 2) + camera_get_view_x(view_camera[0]);
y = 800 + camera_get_view_y(view_camera[0])

var _text = "You found " + item_desc(item_name) + "!"
var _text_w = string_width(_text);

var _alpha = 1;

if timer_life < 30 {
	_alpha = timer_life / 30;	
}

var _x_scale = _text_w / sprite_width;

draw_sprite_ext(sprite_index, -1, x /*- (_text_w / 2)*/, y /*- (sprite_height / 2)*/, _x_scale, 1, 0, c_white,_alpha);
draw_sprite_ext(spr_blankbutton3_left, 0, x - (_text_w / 2),y, 1, 1, 0, c_white, _alpha);
draw_sprite_ext(spr_blankbutton3_right, 0, x + (_text_w / 2),y, 1, 1, 0, c_white, _alpha);

draw_set_halign(fa_center);
draw_text_color(x, y, _text, c_white, c_white, c_white, c_white, _alpha);
