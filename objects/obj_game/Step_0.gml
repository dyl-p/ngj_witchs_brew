/// @description Insert description here
// You can write your code in this editor
if room == rm_lose || room == rm_win {
	instance_destroy();
}

time--;

if time <= 0 {
	//game over stuff
	
	//lose rent money
	money -= rent_amount;
	
	if money < 0 {
		room_persistent = false;
		room_goto(rm_lose);	
	} else if money > 0 {
		room_persistent = false;
		room_goto(rm_win);	
	}
	time = rent_due;
}