/// @description Insert description here
// You can write your code in this editor

draw_text(60, 30, "Inventory | Quantity");


for (var _i = 0; _i < ds_list_size(inventory); _i++){
	draw_text(60, 60 + (_i * 30), inventory[| _i].nm);	
	draw_text(120, 60 + (_i * 30), " | " + string(inventory[| _i].qty));
}