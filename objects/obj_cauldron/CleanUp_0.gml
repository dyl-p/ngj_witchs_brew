/// @description Insert description here
// You can write your code in this editor

for ( var _i = 0; _i < ds_list_size(brew); _i++;){
	item_add_inventory(obj_game.inventory,brew[|_i].name);
}

ds_list_destroy(brew);