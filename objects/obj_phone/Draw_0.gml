/// @description Insert description here
// You can write your code in this editor

var _font_old = draw_get_font();
 draw_set_font(fnt_menu_small);
var _time = obj_game.time;

var _time_day = _time div (60*24);
var _time_hour = (_time mod (30*48)) div 60;

draw_self();
draw_text(x, y - 140, string(_time_day) + " Days, " + string(_time_hour) + " Hours");

draw_set_font(_font_old);