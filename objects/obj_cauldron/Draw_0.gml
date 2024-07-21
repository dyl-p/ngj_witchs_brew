/// @description Insert description here
// You can write your code in this editor

draw_self();
draw_text(x, y - (sprite_height/2), "Place ingredients here");

for (var _i = 0; _i < ds_list_size(brew); _i++){
	draw_sprite(brew[|_i].spr, 0, x + (_i * 65),y - 60);	
}