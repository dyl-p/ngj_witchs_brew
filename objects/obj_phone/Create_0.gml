/// @description Insert description here
// You can write your code in this editor

hover = false;

//y = (900 + camera_get_view_y(view_camera[0]));

btn_potiondash = instance_create_layer(x, y, "Instances_GUI",obj_button_menu_potiondash);
btn_potiondash.depth = depth - 1;
btn_potiondash.text = "";
btn_potiondash.next_room = rm_orders;

btn_map = instance_create_layer(x, y, "Instances_GUI",obj_button_menu_map);
btn_map.depth = depth - 1;
btn_map.text = "";
btn_map.next_room = rm_mapp;

btn_money = instance_create_layer(x, y, "Instances_GUI",obj_button_menu_money);
btn_money.depth = depth - 1;
btn_money.text = "";
btn_money.next_room = rm_orders;

btn_inventory = instance_create_layer(x, y, "Instances_GUI",obj_button_menu);
btn_inventory.depth = depth - 1;
btn_inventory.sprite_index = spr_button_money;
btn_inventory.text = "INV";
btn_inventory.next_room = rm_inventory;