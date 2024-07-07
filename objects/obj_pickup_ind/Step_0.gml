/// @description Insert description here
// You can write your code in this editor

//only let this object appear for so long
timer_life--;

if timer_life < 0 {
	instance_destroy();	
}