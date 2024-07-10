/// @description click to pickup if close
// You can write your code in this editor
if player_has_item(item_name) {
	return;
}	

var _x_diff = obj_player.x - x;
var _y_diff = obj_player.y - y;
var _diff = sqrt(power(_x_diff,2) + power(_y_diff,2));
if(_diff < 200){
	pick_up();
}