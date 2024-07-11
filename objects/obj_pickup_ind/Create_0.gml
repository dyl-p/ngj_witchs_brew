/// @description Insert description here
// You can write your code in this editor

//how long the notification lives for
timer_life = 180;

//the name of the item shown in the notification
item_name = "";

//the y offset in the room where the notification should sit
y_offset = 0;

with(obj_pickup_ind){
	if id != other.id {
		y_offset += 90;	
	}
}