/// @description Insert description here
// You can write your code in this editor

draw_self();

var _boil_perc = boil_current / boil_threshold;

with cauldron {
	
	image_index = (( 4 * _boil_perc ) mod 4); 
	
	draw_sprite_ext(spr_cauldron_dir, 0, x, y - 100,1, 1, other.dir_rot,c_white,1); 
	
	var _y = y + (sprite_height*0.6);
	
	var _prev_color = draw_get_color();
	draw_set_color(c_red);
	draw_rectangle(x - 40, _y, x + 40, _y - (100 * _boil_perc), false);
	draw_set_color(_prev_color);
}