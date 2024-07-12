/// @description Insert description here
// You can write your code in this editor

if (follow != noone) {
	x_to = follow.x;
	y_to = follow.y;
}

x += (x_to - x)/25;
y += (y_to - y)/25;

camera_set_view_pos(view_camera[0], x - (cam_width * 0.5), y-(cam_height*0.5));

//check to see if camera is outside of the room bounds?

if x - (cam_width * 0.5) <= 0 {
	x = cam_width * 0.5;	
} else if x + (cam_width * 0.5) > rm_w {
	x = rm_w - (cam_width * 0.5);
}

if y - (cam_height * 0.5) <= 0 {
	y = cam_height * 0.5;	
} else if y + (cam_height * 0.5) > rm_h {
	y = rm_h - (cam_height * 0.5);
}