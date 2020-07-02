with(obj_board) board_array_create()
var _j = (x - obj_board.x) div 64
var _i = ((y+32 - obj_board.y) div 64) - 1
id._i = _i
id._j = _j
if (y+32 - obj_board.y < 0) {_i = -1}
var halt = false;

if _i >= 0
{
	#region HORIZONTAL
	var jn = 1;
	var jn1 = 0;
	var jn2 = 0;
	for(var j = _j+1; j < 8; j++)
	{
		var who = obj_board.board_array[_i,j]
		if (who != noone)
		{
			if (!who.die_anim_started)
			{
				if (who.image_index == image_index)
				{
					jn1++
					if (who.current_speed != 0) halt = true //its moving, dont match
				}
				else break;
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
			if (!who.die_anim_started)
			{
				if (who.image_index == image_index)
				{
					jn2++
					if (who.current_speed != 0) halt = true //its moving, dont match
				}
				else break;
			}
			else break;
		}
		else break;		
	}	
	
	jn += jn1+jn2
	
	#endregion
	
	#region VERTICAL
	var in = 1;
	var in1 = 0;
	var in2 = 0;
	for(var i = _i+1; i < 8; i++)
	{
		var who = obj_board.board_array[i,_j]
		if (who != noone)
		{
			if (!who.die_anim_started)
			{
				if (who.image_index == image_index)
				{
					in1++
					if (who.current_speed != 0) halt = true //its moving, dont match
				}
				else break;
			}
			else break;
		}
		else break;		
	}
	for(var i = _i-1; i >= 0; i--)
	{
		var who = obj_board.board_array[i,_j]
		if (who != noone)
		{
			if (!who.die_anim_started)
			{
				if (who.image_index == image_index)
				{
					in2++
					if (who.current_speed != 0) halt = true //its moving, dont match
				}
				else break;
			}
			else break;
		}
		else break;		
	}
	
	in += in1+in2
	#endregion	
	
	#region kill gems
	if (!halt)
	{
		var matchdone = false;
		if (jn >= 3)
		{
			for(var j = _j - jn2; j <= _j + jn1; j++)
			{
				with(obj_board.board_array[_i,j]) gem_die(true)
			}
			matchdone = true;
		}
		
		if (in >= 3)
		{
			for(var i = _i - in2; i <= _i + in1; i++)
			{
				with(obj_board.board_array[i,_j]) gem_die(true)
			}
			matchdone = true;
		}
		if (matchdone) increase_cascades()
	}
	#endregion
	
}

