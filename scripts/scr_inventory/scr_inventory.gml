// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_inventory(){

}

///@function					potion_check_recipe(_ing_1, _ing_2, _ing_3)
///@param {array} _ingredients		First Ingredient

//returns the item that would be created by a given list of ingredients
function potion_check_recipe(_ingredients){
	
	//create a list of all the potion options so we can see if any are made
	var _potions = ["speedwalking", "instant_rizz", "talk_to_cats", "night_owl", "antidepressant", "hangover_cure", "beauty_potion"];

	//check to see if we are making a potion
	for (var _i = 0; _i < array_length(_potions); _i++){
		
		show_debug_message("potions: " + string(_i));
		
		var _matches = 0;								//number of ingredients that match a potion
		var _potion = item_get_struct(_potions[_i]);
		
		show_debug_message(_potions[_i]);
		
		//check each potion in the potion's ingredients
		for (var _j = 0; _j < array_length(_potion.ingredients); _j++) {
			
			show_debug_message("potions ingredient: " + string(_j));
			
			//against each ingredient
			for (var _k = 0; _k < array_length(_ingredients); _k++){
				show_debug_message("mix ingredient: " + string(_k));
				if _potion.ingredients[_j] == _ingredients[_k] {
					_matches += 1;
				}
			}
		}
		
		//if we have a perfect match then we have made a potion!
		if _matches == array_length(_potion.ingredients){
			return _potion.name;	
		}
	}

	// if we get here we haven't found a potion
	return -1;

}

//add an item to the inventory
function item_add_inventory(_list, _name){
	
	//check to see if the item already exists
	var _item_added = false;
	
	for (var _i = 0; _i < ds_list_size(_list); _i++) {
		
		//check to see if the current space has an inventory item
		if _list[|_i] != -1 {
			if _list[| _i].name	== _name {
				//check to see if we've reached the max stack size
				if _list[|_i].qty < _list[|_i].max_qty {
					_list[| _i].qty += 1;
					_item_added = true;
					return _i;
				}
			}
		}
	}
	
	//if the item doesn't exist on the list create a new one!
	if !_item_added {
		
		//the inventory is prepolated with -1 so you have to 
		//use the replace function to keep the list size
		for (var _i = 0; _i < ds_list_size(_list); _i++) {
			if _list[|_i] == -1 {
				ds_list_replace(_list, _i, item_get_struct(_name));
				return _i;
			}
		}
	}
}

//recreate the inventory based on items currently in the inventory room
function inventory_recreate(){

	//array of inventory slots used
	var _slot_pos = [];

	with obj_inventory_item {
	
		// find the slot that the item is in
		var _slot = instance_place(x, y, obj_inventory_slot);
	
		//add the position to the array so we know what items not to remove from the inventory ds_list
		array_push(_slot_pos, _slot.position);
	
		//replace the item in the inventory ds_list, set the quantity
		ds_list_replace(obj_game.inventory, _slot.position, item_get_struct(name))
		obj_game.inventory[|_slot.position].qty = qty;
	}

	//get length of _slot_pos array so we don't have to do something more costly
	var _len = array_length(_slot_pos);

	//sort the array for consisten use in the following loop
	array_sort(_slot_pos,false);
	show_debug_message(_slot_pos);

	for (var _i = 0; _i < ds_list_size(obj_game.inventory); _i++;) {
	
		//if the last item is not the current _i then set it to -1
	
		if _len >= 0 {
			if _i != _slot_pos[_len - 1] {
				//reset the place in the inventory because there shouldn't be something here.
				ds_list_replace(obj_game.inventory,_i, -1);
			} else {
				//remove the last item if we've found it
				array_pop(_slot_pos);
				_len -= 1;
				show_debug_message(_len);
			}
		} else {
			ds_list_replace(obj_game.inventory,_i, -1);
		}
	}	
}

#region retrive items based on names

/// @function				item_get_struct(_name)
/// @param1 {string} _name	The name of the item to return
/// @description			Retrieve the item struct based on it's name

function item_get_struct(_name){
	switch (_name) {
	    case "half_coffee":
	        return new ItemHalfCoffee();
		case "owl_feather":
			return new ItemOwlFeather();
	    case "cattail":
	        return new ItemCattail();
		case "glass_milk":
			return new ItemGlassMilk();
	    case "hairball":
	        return new ItemHairball();
		case "ash":
			return new ItemAsh();
		case "bacon":
			return new ItemBacon();
		case "bandaid":
			return new ItemBandaid();
		case "eyeofnewt":
			return new ItemEyeOfNewt();
		case "pictureoftoad":
			return new ItemPictureOfToad();
		case "syringe":
			return new ItemSyringe();
		case "waterbottle":
			return new ItemWaterbottle();
		case "wine":
			return new ItemWine();
		case "heartstone":
			return new ItemHeartstone();
		case "gum":
			return new ItemGum();
		case "rose":
			return new ItemRose();
		case "banana":
			return new ItemBanana();
	    case "speedwalking":
	        return new ItemSpeedwalkPotion();
		case "instant_rizz":
			return new ItemRizzPotion();
	    case "talk_to_cats":
	        return new ItemTalkToCatsPotion();
		case "night_owl":
			return new ItemNightOwlPotion();
	    case "antidepressant":
	        return new ItemAntidepressantPotion();
		case "hangover_cure":
			return new ItemHangoverCurePotion();
		case "beauty_potion":
			return new ItemBeautyFilterPotion();
	    default:
	        return noone;
	}	
}

#endregion

#region Inventory Item Structs

//the basic pieces of data required to define an inventory item
function Item () constructor {
	name = "";		//name of item
	desc = "";			//description of item
	spr = noone;		//sprite of item
	qty = 1;			//quantity of item
	loc = -1;
	type = "item";		//used to identify between different types of things in the inventory
	val = 0;
	max_qty = 20;
}

function ItemHalfCoffee (): Item () constructor {
	name ="half_coffee";
	desc = "half a coffee";
	spr = spr_coffee;
}

function ItemOwlFeather (): Item () constructor {
	name = "owl_feather";
	desc = "an owl's feather";
	spr = spr_icon_owl_feather;
}

function ItemCattail (): Item () constructor {
	name="cattail";
	desc = "a cattail";
	spr = spr_icon_cattails;
}

function ItemGlassMilk (): Item () constructor {
	name="glass_milk";
	desc = "a partially drunk glass of milk";
	spr = spr_icon_milk;
}

function ItemHairball (): Item () constructor {
	name="hairball";
	desc = "a coughed up hairball";
	spr = spr_icon_hairball;
}

function ItemAsh (): Item () constructor {
	name = "ash";
	desc = "a pile of cigarette ash";
	spr = spr_icon_ash;
}

function ItemBacon (): Item () constructor {
	name = "bacon";
	desc = "delicious bacon :)";
	spr = spr_icon_bacon;
}

function ItemBandaid (): Item () constructor {
	name = "bandaid";
	desc = "a gross used bandaid";
	spr = spr_bandaid;
}

function ItemEyeOfNewt (): Item () constructor {
	name = "eyeofnewt";
	desc = "an eye of newt";
	spr = spr_icon_eyeofnewt;
}

function ItemPictureOfToad (): Item () constructor {
	name="pictureoftoad";
	desc = "a picture of a toad";
	spr = spr_icon_pictureoftoad;
}

function ItemSyringe (): Item () constructor {
	name = "syringe";
	desc = "a syringe, be careful!";
	spr = spr_icon_syringe;
}

function ItemWaterbottle (): Item () constructor {
	name = "waterbottle";
	desc = "a bottle of fizzy water";
	spr = spr_icon_waterbottle;
}

function ItemWine (): Item () constructor {
	name = "wine";
	desc = "someone's abandoned wine glass";
	spr = spr_icon_wine_glass;
}

function ItemHeartstone (): Item () constructor {
	name = "heartstone";
	desc = "a heartstone from the mountain";
	spr = spr_icon_heartstone;
}

function ItemGum (): Item () constructor {
	name = "gum";
	desc = "previously enjoyed gum";
	spr = spr_icon_gum;
}

function ItemRose (): Item () constructor {
	name = "rose";
	desc = "a beautiful rose";
	spr = spr_icon_rose;
}

function ItemBanana (): Item () constructor {
	name = "banana";
	desc = "a slippery banana peel";
	spr = spr_icon_banana;
}

function ItemSpeedwalkPotion (): Item () constructor {
	name = "speedwalking"
	ingredients = ["banana", "glass_milk", "heartstone"];
	val = 105;
	spr = spr_potion_speedwalk_icon;
}

function ItemRizzPotion (): Item () constructor {
	name = "instant_rizz";
	ingredients = ["heartstone", "gum", "rose"];
	val = 105;
	spr = spr_potion_rizzpotion_icon;
}

function ItemTalkToCatsPotion (): Item () constructor {
	name = "talk_to_cats";
	ingredients = ["glass_milk", "cattail", "hairball"];
	val = 105;
	spr = spr_potion_speaktocats_icon;
}

function ItemNightOwlPotion (): Item () constructor {
	name = "night_owl";
	ingredients = ["half_coffee", "owl_feather"];
	val = 75;
	spr = spr_potion_nightowl_icon;
}

function ItemAntidepressantPotion (): Item () constructor {
	name = "antidepressant";
	ingredients = ["ash", "waterbottle", "bacon"];
	val = 99;
	spr = spr_potion_antidepressant_icon;
}

function ItemHangoverCurePotion (): Item () constructor {
	name = "hangover_cure";
	ingredients = ["waterbottle", "eyeofnewt", "bandaid"];
	val = 69;
	spr = spr_potion_antihangover_icon;
}

function ItemBeautyFilterPotion (): Item () constructor {
	name = "beauty_potion";
	ingredients = ["wine", "syringe", "pictureoftoad"];
	val = 128;
	spr = spr_potion_beautyfilter_icon;
}

#endregion