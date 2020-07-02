current_speed += acceleration //move that many pixels, as long as there is no collision or anything
var board_end_snap = obj_board.y + obj_board.sprite_height - 32 //this is the max distance the gem can fall
//I added this because I didn't want the gem to check for other collisions other than the gem object

if (y+current_speed >=  board_end_snap) //if we are going to reach the end of the board
{
	current_speed = 0; //stop
	y =  board_end_snap //and put us in the last grid of the board
}
else
{
	var gem_below = collision_point(x,y + 32 +current_speed,obj_gem,false,true)
	if (gem_below != noone)
	{
		if (gem_below.current_speed <= current_speed) current_speed = gem_below.current_speed
		y = gem_below.y - 64 - current_speed //put our gem just above the other gem, and subtract the future speed increase
	}
}

//If the gem stops\\
if (current_speed == 0)
{
	if (yprev != y) //do not do the scripts below more than once
	{
		audio_play_sound(snd_gem_stop,0,0)
		check_for_matches()
	}
}
//\\
yprev = y+current_speed //update our y history

if (!die_anim_started) y += current_speed //physics is enabled, as long as we are not dying
