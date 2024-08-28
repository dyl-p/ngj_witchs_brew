/// @description Insert description here
// You can write your code in this editor

if state = "active" {
	timer--;
	
	if timer <= 0 {
		shut_down_the_cauldron();	
	}
}