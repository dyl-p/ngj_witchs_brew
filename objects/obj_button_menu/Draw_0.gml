/// @description Insert description here
// You can write your code in this editor

draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_center);


if hover {
	var _lerp = 1.1 * x_scale;
	var _lerp_amt = 0.1;

	image_xscale = lerp(image_xscale, _lerp, _lerp_amt);
	image_yscale = lerp(image_yscale, _lerp, _lerp_amt);
	
} else {
	var _lerp = 1 * x_scale;
	var _lerp_amt = 0.1;

	image_xscale = lerp(image_xscale, _lerp, _lerp_amt);
	image_yscale = lerp(image_yscale, _lerp, _lerp_amt);
}

draw_text_transformed(x, y, text,image_xscale,image_yscale,0);