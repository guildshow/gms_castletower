///scr_entity_bug_check_ledges()

/**
 * Check Entities for the Edge of Platforms
 * /

// used by NPCs to turn around
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


/**
 * If Entity has Walked off a Ledge
 *
 * depending on the direction of gravity and the edge fallen off,
 * switch gravity to force the entity to "fall" back towards the wall
 */

if (previously_grounded && ! grounded)
{
    if (horizontal_gravity != 0)
    {
        // if on a western wall and falling off the right side (my > 0), switch to a ceiling (vert grav = -1)
        // if on a western wall and falling off the left side (my < 0), switch to a floor (vert grav = 1)

        // if on an eastern wall and falling off the right side (my < 0), switch to a floor (vert grav = 1)
        // if on an eastern wall and falling off the left side (my > 0), switch to a ceiling (vert grav = -1)
        
        temp_vertical_gravity = sign(my) * -1;
        temp_horizontal_gravity = 0;
    }
    
    else if (vertical_gravity != 0)
    {
        // if on a floor and falling off the right side (mx > 0), switch to a western wall (horz grav = -1)
        // if on a floor and falling off the left side (mx < 0), switch to an eastern wall (horz grav = 1)
        
        // if on a ceiling and falling off the right side (mx < 0), switch to an eastern wall (horz grav = 1)
        // if on a ceiling and falling off the left side (mx > 0), switch to a western wall (horz grav = -1)
        
        temp_vertical_gravity = 0;
        temp_horizontal_gravity = sign(mx) * -1;
    }
}


