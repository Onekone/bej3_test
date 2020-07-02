///@function spawn_gems(x,y)
///@param x
///@param y
var X = argument0
var Y = argument1
for(var i = 0; i < 8; i++)
{
	for(var j = 0; j < 8; j++)
	{
		instance_create_depth(X + j*64,Y - i*64,DEPTH_GEMS,obj_gem)
	}
}