/**
 * Bug: Is Moving
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
        if (vertical_gravity == -1 || horizontal_gravity == 1)
        {
            // move in the opposite direction
            temp_velocity = speed_x * facing * -1;
        }
    }
    
    if (vertical_gravity != 0)
    {
        velocity_x = temp_velocity;
    }
    else if (horizontal_gravity != 0)
    {
        velocity_y = temp_velocity;
    }
}

