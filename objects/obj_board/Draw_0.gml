draw_self()
for(var i = 0; i < 8; i++)
{
	for(var j = 0; j < 8; j++)
	{
		draw_text(16 + 16*j, 16 + 16*i, board_skins[i,j])
	}
}
draw_text(16,256,"Right click: Remove horizontally\nLeft Click: Remove vertically")