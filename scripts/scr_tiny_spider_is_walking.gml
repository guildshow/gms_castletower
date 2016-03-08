/**
 * Tiny Spider: Is Moving
 *
 */

if ( ! dying && ! hurting)
{
    // reset parameters
    walking = false;
    temp_velocity = 0;
    
    if (key_left || key_right)
    {
        if (key_left)
        {
            facing = LEFT; // -1
        }
        else if (key_right)
        {
            facing = RIGHT; // 1
        }
        
        walking = true;
        temp_velocity = speed_x * facing;
        
        // if walking along a ceiling or eastern wall
        if (gravity_y == -1 || gravity_x == 1)
        {
            // move in the opposite direction
            temp_velocity = speed_x * facing * -1;
        }
    }
    
    if (gravity_y != 0)
    {
        velocity_x = temp_velocity;
    }
    else if (gravity_x != 0)
    {
        velocity_y = temp_velocity;
    }
}

