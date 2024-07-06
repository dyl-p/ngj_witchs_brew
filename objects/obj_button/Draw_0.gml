/// @description Insert description here
// You can write your code in this editor
draw_self();

var _old_ha = draw_get_halign();
var _old_va = draw_get_valign();
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(x, y, text);

draw_set_halign(_old_ha);
draw_set_valign(_old_va);

