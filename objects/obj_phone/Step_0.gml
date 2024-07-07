/// @description Insert description here
// You can write your code in this editor

if hover {
	y = lerp(y, (900 + camera_get_view_y(view_camera[0])), 0.1);
} else {
	y = lerp(y, (995 + camera_get_view_y(view_camera[0])), 0.1);	
}

x = (view_get_wport(0) / 9) + camera_get_view_x(view_camera[0]);

btn_potiondash.x = x;
btn_potiondash.y = y - 95;

btn_map.x = x - 35;
btn_map.y = y - 40;

btn_money.x = x + 35;
btn_money.y = y - 40;