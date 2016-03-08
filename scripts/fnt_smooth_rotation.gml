///fnt_smooth_rotation(dest_angle, angle_value, speed)

var dest_angle = argument0;
var angle_value = argument1;
var diff = dest_angle - angle_value;

/*
//This is where the action is!
if (diff >= 180 && angle_value < 180)
{
    angle_value += 360;
}
else if (diff <= -180)
{
    angle_value -= 360;
    //return angle_value;
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
*/

//This is where the action is!
if (diff >= 180 && angle_value < 180)
{
    angle_value += 360;
}
else if (diff <= -180)
{
    angle_value -= 360;
}
else
{
    if (angle_value != dest_angle)
    {
        var diff;
        diff = dest_angle - angle_value;
        if (abs(diff) < argument2)
        {
            angle_value += diff;
        }
        else
        {
            angle_value += argument2*sign(diff);
        }
    }
}

return angle_value;

