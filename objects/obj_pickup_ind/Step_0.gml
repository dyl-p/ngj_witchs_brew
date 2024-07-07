/// @description Insert description here
// You can write your code in this editor

//only let this object appear for so long
timer_life--;

if timer_life < 0 {
	instance_destroy();	
}

//move this object with the camera

x = (view_get_wport(0) / 2) + camera_get_view_x(view_camera[0]);
y = 800 + camera_get_view_y(view_camera[0])