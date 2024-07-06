/// @description Insert description here
// You can write your code in this editor

//var _w = camera_get_view_width(0);
//var _h = camera_get_view_height(0);

//draw_text(60, 60, x);
//draw_text(60, 120, y);

//if room_get_name(room) == "Room1" {
//	btn_order.x = x + (_w / 2);
//	btn_order.y = y + ((5 * _h )/ 10 );
//}

var _h = display_get_gui_height();
var _w = display_get_gui_width();

if room_get_name(room) == "Room1" {
	btn_order.x = _h / 5;
	btn_order.y = _w / 2;
}