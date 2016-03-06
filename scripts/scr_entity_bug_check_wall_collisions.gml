///scr_entity_bug_check_wall_collisions()

/**
 * Check if Colliding with Walls
 *
 * Include in the End Step Event of an object.
 */

// check horizontal collision
if (place_meeting(x + mx, y, obj_wall))
{
    temp_mx = 0;
    while ( ! place_meeting(x + temp_mx + sign(mx), y, obj_wall))
    {
        temp_mx += sign(mx);
    }
    
    //if (vertical_gravity != 0)
    if (gravity_y != 0)
    {
        // if on a floor or ceiling and hitting an eastern wall (mx > 0), switch to eastern wall (horz grav = 1)
        // if on a floor or ceiling and hitting a western wall (mx < 0), switch to western wall (horz grav = -1)
        
        temp_gravity_x = sign(mx);
        temp_gravity_y = 0;
    }
    
    mx = temp_mx;
    velocity_x = 0;
}

// check vertical collision
if (place_meeting(x + mx, y + my, obj_wall))
{
    temp_my = 0;
    while ( ! place_meeting(x + mx, y + temp_my + sign(my), obj_wall))
    {
        temp_my += sign(my);
    }
    
    //if (horizontal_gravity != 0)
    if (gravity_x != 0)
    {
        // if on a western or eastern wall and hitting a ceiling (my < 0), switch to ceiling (vert grav = -1)
        // if on a western or eastern wall and hitting a floor (my > 0), switch to floor (vert grav = 1);
        
        temp_gravity_x = 0;
        temp_gravity_y = sign(my);
    }
    
    my = temp_my;
    velocity_y = 0;
}

