// Initialise Viewports
view_enabled = true;
view_visible[0] = true;

view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 1600;
view_hport[0] = 900;

view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, obj_player_old, -1, -1, 1600, 900);

surface_resize(application_surface, 1600, 900);