/// @description DEATH ANIM ZOOM IN
die_anim_started = true;
die_anim_lerp += die_anim_speed
die_anim_scale = lerp(0,die_anim_max_zoom,die_anim_lerp)
if (die_anim_lerp >= 1)
{
	die_anim_lerp = 0
	alarm[1] = 1	
}
else alarm[0] = 1

