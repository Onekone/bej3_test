///@param is_cascade
var is_cascade = argument0
if (!die_anim_started)
{
	if (is_cascade)
	{
		alarm[0] = 1
	}
	else
	{
		die_anim_speed = 0.1
		die_anim_max_zoom = 0;
		alarm[1] = 1
	}
}