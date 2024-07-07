/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if hover {
	var _lerp = 1.2;
	var _lerp_amt = 0.1;

	image_xscale = lerp(image_xscale, _lerp, _lerp_amt);
	image_yscale = lerp(image_yscale, _lerp, _lerp_amt);
	
} else {
	var _lerp = 1;
	var _lerp_amt = 0.1;

	image_xscale = lerp(image_xscale, _lerp, _lerp_amt);
	image_yscale = lerp(image_yscale, _lerp, _lerp_amt);
}