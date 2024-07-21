/// @description Insert description here
// You can write your code in this editor

// follow camera and animate on hover

var _w = camera_get_view_width(view_camera[0]);
var _h = camera_get_view_height(view_camera[0]);
var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);

//show_debug_message("Width: " + string(_w) + ", Height:" + string(_h) + ", x:" + string(_x) + ", y:" + string(_y));

x = (_w / 9) + _x;
if hover {
	y = lerp(y, (_h + _y), 0.1);
} else {
	y = lerp(y, (_h + (sprite_height/3) + _y), 0.1);	
}
btn_potiondash.x = x - (sprite_width/7);
btn_potiondash.y = y - 95;
btn_map.x = x + (sprite_width/4);
btn_map.y = y - 95;


btn_money.x = x + 70;
btn_money.y = y - 40;

btn_inventory.x = x;
btn_inventory.y = y - 40;

btn_cauldron.x = x - 70;
btn_cauldron.y = y - 40;

var _font_old = draw_get_font();
 draw_set_font(fnt_menu_small);
var _time = obj_game.time;

var _time_day = _time div (60*24);
var _time_hour = (_time mod (30*48)) div 60;

draw_self();
draw_text(x, y - 140, "Rent Due: " + string(_time_day) + " Days, " + string(_time_hour) + " Hours");

draw_set_font(_font_old);