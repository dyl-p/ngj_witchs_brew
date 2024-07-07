/// @description Insert description here
// You can write your code in this editor



value = 0;

if instance_exists(obj_order){

	//check to see if any orders are deliverable
	for (var _i = 0; _i < instance_number(obj_order); _i++;)
	{
		var _inst =  instance_find(obj_order, _i);
	
		if _inst.delivery_ready {
			value += _inst.value;
		}
	}
}
