///scr_entity_bug_check_wall_edges()

/**
 * Check if Reached the Edge of a Wall
 *
 * Include in the End Step Event of an object.
 */

/*
entity_at_wall_edge = false;

if (grounded && walking)
{
    // if rightside up
    if (gravity_factor == 1)
    {
        // if moving left and no wall below
        if (key_left && ! position_meeting(bbox_left - 1, bbox_bottom + 1, obj_wall))
        {
            entity_at_wall_edge = true;
        }
        // else, if moving right and no wall below
        else if (key_right && ! position_meeting(bbox_right + 1, bbox_bottom + 1, obj_wall))
        {
            entity_at_wall_edge = true;
        }
    }
    
    // if upside down
    else if (gravity_factor == -1)
    {
        if (key_left && ! position_meeting(bbox_left + 1, bbox_top - 1, obj_wall))
        {
            entity_at_wall_edge = true;
        }
        else if (key_right && ! position_meeting(bbox_right - 1, bbox_top - 1, obj_wall))
        {
            entity_at_wall_edge = true;
        }
    }
}
*/


/**
 * Check if Walked Off the Edge of a Wall
 *
 * Depending on the direction of gravity and the edge the object has fallen off,
 * switch gravity to force the object to "fall" back towards the wall.
 */

if (walking && previously_grounded && ! grounded)
{
    if (gravity_x != 0)
    {
        // if on a western wall and falling off the right side (my > 0), switch to a ceiling (vert grav = -1)
        // if on a western wall and falling off the left side (my < 0), switch to a floor (vert grav = 1)
        
        // if on an eastern wall and falling off the right side (my < 0), switch to a floor (vert grav = 1)
        // if on an eastern wall and falling off the left side (my > 0), switch to a ceiling (vert grav = -1)
        
        temp_gravity_x = 0;
        temp_gravity_y = sign(my) * -1;
    }
    
    else if (gravity_y != 0)
    {
        // if on a floor and falling off the right side (mx > 0), switch to a western wall (horz grav = -1)
        // if on a floor and falling off the left side (mx < 0), switch to an eastern wall (horz grav = 1)
        
        // if on a ceiling and falling off the right side (mx < 0), switch to an eastern wall (horz grav = 1)
        // if on a ceiling and falling off the left side (mx > 0), switch to a western wall (horz grav = -1)
        
        temp_gravity_x = sign(mx) * -1;
        temp_gravity_y = 0;
    }
}

