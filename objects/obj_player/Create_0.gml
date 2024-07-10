/// @description Insert description here
// You can write your code in this editor

spd = 7;
spd_angle = 0.65;

<<<<<<< Updated upstream
pickup = instance_create_layer(x, y, "Objects",obj_player_hands);
pickup_dist = 24;

dir = "left";
=======
my_speed = 0;
my_speed_start = 0.1;
my_speed_max = 7.5;
my_acceleration = 1.35;
my_friction = 0.59;
my_angle_rot_max = 15;

my_pickup = instance_create_depth(x, y, 0, obj_player_hands);
my_pickup_dist_h = 30;
my_pickup_dist_v = 30;

dir_prev = 5;

mask_index = spr_player;

#endregion
>>>>>>> Stashed changes
