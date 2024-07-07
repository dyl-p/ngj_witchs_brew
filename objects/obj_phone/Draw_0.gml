/// @description Insert description here
// You can write your code in this editor

// follow camera and animate on hover
x = (view_get_wport(0) / 9) + camera_get_view_x(view_camera[0]);
if hover {
	y = lerp(y, (900 + camera_get_view_y(view_camera[0])), 0.1);
} else {
	y = lerp(y, (995 + camera_get_view_y(view_camera[0])), 0.1);	
}
btn_potiondash.x = x;
btn_potiondash.y = y - 95;
btn_map.x = x - 35;
btn_map.y = y - 40;
btn_money.x = x + 35;
btn_money.y = y - 40;

var _font_old = draw_get_font();
 draw_set_font(fnt_menu_small);
var _time = obj_game.time;

var _time_day = _time div (60*24);
var _time_hour = (_time mod (30*48)) div 60;

draw_self();
draw_text(x, y - 140, string(_time_day) + " Days, " + string(_time_hour) + " Hours");

draw_set_font(_font_old);