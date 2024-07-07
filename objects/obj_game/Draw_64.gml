/// @description Insert description here
// You can write your code in this editor

var _time_x = view_get_hport(0) - (sprite_get_width(spr_timer_bg)/2);
var _time_y = 60;

draw_sprite(spr_timer_bg, 0, _time_x, _time_y);
draw_sprite_ext(spr_timer_fg, 0, _time_x + 1, _time_y, time / rent_due, 1, 0, c_white, 1);
draw_text(_time_x, _time_y + 30, money);

draw_text( 10, 10, room_persistent);