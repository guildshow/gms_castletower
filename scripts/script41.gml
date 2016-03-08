//rot_smooth(dest_angle,angle_value,speed,cap)

var dest_angle = argument0;
var angle_value = argument1;
var diff = dest_angle - angle_value;

//This is where the action is!
if (diff >= 180 && angle_value < 180)
{
    angle_value += 360;
}
else if (diff <= -180)
{
    angle_value -= 360;
    return angle_value;
}

//Check the cap
if (argument3 == -1)
{
    angle_value += diff / argument2;
}
else
{
    if (diff / argument2 < argument3)
    {
        angle_value += diff / argument2;
    }
    else
    {
        angle_value += argument3*sign(diff);
    }
}

return angle_value;

