/// @description Insert description here
// You can write your code in this editor

/*
minigame ideas

ingredients spawn then shoot along a parabola into the cauldron

you have to stir the cauldron (A-D? or maybe mouse?)
and put the ingredients in at the right time

crit load but each crit spot is an ingredient

maybe the minigame makes potion faster/ but also better?
3 potion rarities, you'll get more money for a rare potion?

*/

//the cauldron is not active while dormant
state = "dormant";
//to set the cauldron active state = "active";

spoon = noone;

timer = 50;


fire_up_the_cauldron = function() {
	//create the spoon
	spoon = instance_create_layer(x, y, "Instances", obj_mix_spoon);
	spoon.depth = -200;
	
	with spoon {
		path_start(pth_cauldron, 1.5, path_action_continue,true);
	}
	
	//set the cauldron to active
	state = "active";
}

shut_down_the_cauldron = function() {
	spoon = noone;
	state = "dormant";
	
	timer = 50;
	
	with spoon {
		path_end();
	}
}