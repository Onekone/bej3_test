board_reset()
var n;

for (var j = 0; j < 8; j++)
{
	n = 7;
	for(var i = 0 ; i <= 16; i++) //I don't just want the 8 gems that are in the board, but also find freshly spawned gems much above the board
	{
		var g = instance_position(obj_board.x+32 + j*64,obj_board.y + obj_board.sprite_height-32 - i*64,obj_gem)
		if (g != noone)
		{
			board_array[n,j] = g
			board_skins[n,j] = g.image_index
			n--
		}
		if (n < 0) break;
	}
}