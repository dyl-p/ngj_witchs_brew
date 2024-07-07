/// @description Insert description here
// You can write your code in this editor

//if the button is disabled grey it out
if disable {
	image_alpha = 0.5;
	draw_self();
} else {
	image_alpha = 1;
	
	// Inherit the parent event
	event_inherited();
}