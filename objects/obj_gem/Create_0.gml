image_xscale = 1/(sprite_width/64) //always be 64x64 (in this case xscale = 0.25 or 1/4)
image_yscale = image_xscale
current_speed = 0 //current velocity
yprev = 0 //y before speed change
_i = 0
_j = 0
acceleration = 0.4 //add this number to the velocity
image_index = irandom(6)
image_speed = 0;

die_anim_scale = 0; //current image scale for death animation
die_anim_lerp = 0 //current lerp amount for death animation
die_anim_speed = 0.05 //current lerp amount change speed for death animation
die_anim_started = false //are we currently dying? (=is the death animation running)
die_anim_max_zoom = 0.15 //maximum zoom in when doing the death animation