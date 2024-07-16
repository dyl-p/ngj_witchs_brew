/// @description Insert description here
// You can write your code in this editor

//if we're exiting a screen where obj_game is involved go back to the level that it was created in.
if instance_exists(obj_game) {
	room_goto(obj_game.my_room);	
} else {
	event_inherited();
	
}