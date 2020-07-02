with(obj_board) board_array_create() //put all gems in an array as if their physics step event has finished
var _j = (x - obj_board.x) div 64 //collumn
var _i = ((y+32 - obj_board.y) div 64) - 1 //row
id._i = _i //debug to show in draw event
id._j = _j //debug to show in draw event
if (y+32 - obj_board.y < 0) {_i = -1} //we care as long as _i >= 0
var halt = false; //if a gem matches with me but is still moving, halt this and dont kill the gems

if _i >= 0
{
	#region HORIZONTAL
	var jn = 1; //my gem is jn, it counts as one gem with the same skin as me (duh)
	var jn1 = 0; //number of skins that are same as me from the right side
	var jn2 = 0; //number of skins that are same as me from the left side
	for(var j = _j+1; j < 8; j++)
	{
		var who = obj_board.board_array[_i,j]
		if (who != noone)
		{
			if (!who.die_anim_started) && (who.image_index == image_index)
			{
				jn1++
				if (who.current_speed != 0) halt = true //its moving, dont match

			}
			else break;
		}
		else break;		
	}
	for(var j = _j-1; j >= 0; j--)
	{
		var who = obj_board.board_array[_i,j]
		if (who != noone)
		{
			if (!who.die_anim_started) && (who.image_index == image_index)
			{
				jn2++
				if (who.current_speed != 0) halt = true //its moving, dont match
			}
			else break;
		}
		else break;		
	}	
	
	jn += jn1+jn2 //so how many skins in a row are the same?
	
	#endregion
	
	#region kill gems
	if (!halt)
	{
		//var matchdone = false;
		if (jn >= 3) //if we have at least a 3 gem match
		{
			for(var j = _j - jn2; j <= _j + jn1; j++) //start from the left, go to the right and kill those gems
			{
				with(obj_board.board_array[_i,j]) gem_die(true)
			}
			increase_cascades()
		}
		//if (matchdone) increase_cascades()
	}
	#endregion
	
}

