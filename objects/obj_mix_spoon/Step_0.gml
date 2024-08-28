/// @description Insert description here
// You can write your code in this editor

if path_position < 0.5 {
	image_angle = angle_min + (angle_apex * 2 * (path_position * 2));
} else {
	image_angle = angle_apex + (angle_min * 2 * ((path_position mod 0.5)* 2));	
}