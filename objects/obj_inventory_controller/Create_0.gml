/// @description Insert description here
// You can write your code in this editor

#region object variables

items = ds_list_create();

#endregion

#region functions

//new function for controller to place items
place_items = function(_slot, _item_sel, _item_n_sel = noone, _qty = -1){
	
	//_slot = the obj_inventory_slot we're interacting with
	//_item_sel = the selected item we're interacting with
	//_item_n_sel = the not selected item that may become selected, if it exists
	//_qty = the amount of the item being placed
	
	
	
	//if no quantity is provided then set the qty to the items quantity
	if _qty == -1 {
		_qty = _item_sel.qty;
	}
	
	show_debug_message(_item_sel.name);
	
	//add the item quantities together if they're the same item type
	if _item_n_sel != noone {
		if (_item_sel.name ==  _item_n_sel.name){
			
			//increase the quantity in inventory (object and ds_list)
			_item_n_sel.qty += _qty;
			obj_game.inventory[|_slot.position].qty += _qty;

			//decrease the quantity of items being held
			_item_sel.qty -= _qty;
		
		}
	}

	//if there isn't an item where we're placing this
	if _item_n_sel == noone {
		var _item_new = instance_create_layer(_slot.x, _slot.y,"Instances",obj_inventory_item,item_get_struct(_item_sel.name));
		_item_new.qty = _qty;
		ds_list_replace(obj_game.inventory,_slot.position,item_get_struct(_item_sel.name));
		obj_game.inventory[|_slot.position].qty = _qty;
		
		_item_sel.qty -= _qty;
	}
	
	//destroy the item if there are no more!
	if _item_sel.qty <= 0 {
		instance_destroy(_item_sel);	
	}
}

#endregion