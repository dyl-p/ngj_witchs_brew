/// @description Insert description here
// You can write your code in this editor

if instance_exists(obj_game){
	text = "$ " + string(obj_game.money - obj_game.rent_amount);
}