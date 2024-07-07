/// @description Insert description here
// You can write your code in this editor

var _font_old = draw_get_font();

draw_set_font(fnt_menu_small);
// Inherit the parent event
event_inherited();

draw_set_font(_font_old);