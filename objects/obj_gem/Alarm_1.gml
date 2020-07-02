/// @description DEATH ANIM ZOOM OUT
die_anim_lerp += die_anim_speed
die_anim_scale = lerp(die_anim_max_zoom,-image_xscale,die_anim_lerp)
if (die_anim_lerp >= 1)
{
	instance_destroy()
}
else alarm[1] = 1
