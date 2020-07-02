///@description Create a new gem when I die

var new_y = obj_board.y - 128 //Above the board
while(position_meeting(x,new_y,obj_gem)) //as long as there isn't another gem spawning in there
{
	new_y -= 64 //if so, go up further
}
instance_create_depth(x,new_y,DEPTH_GEMS,obj_gem) //create the new gem there