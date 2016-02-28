/**
 * Bug: Is Moving
 *
 * LEFT: -1, RIGHT: 1
 */

if ( ! dying && ! hurting)
{
    if (key_left)
    {
        facing = LEFT;
        walking = true;
        velocity_x = speed_x * facing;
        
        if (horizontal_gravity)
        {
            // falling to the EAST
            if (gravity_factor == 1)
            {
                velocity_x = speed_x * 1;
            }
        }
        else if (vertical_gravity)
        {
            // falling UP
            if (gravity_factor == -1)
            {
                velocity_x = speed_x * 1;
            }
        }
    }
    else if (key_right)
    {
        facing = RIGHT;
        walking = true;
        velocity_x = speed_x * facing;
        
        if (horizontal_gravity)
        {
            // falling to the EAST
            if (gravity_factor == 1)
            {
                velocity_x = speed_x * -1;
            }
        }
        else if (vertical_gravity)
        {
            // fallig UP
            if (gravity_factor == -1)
            {
                velocity_x = speed_x * -1;
            }
        }
    }
    else
    {
        walking = false;
        velocity_x = 0;
    }
}

