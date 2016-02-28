/**
 * Tiny Spider: On End of Update
 *
 */


/**
 * Update Movement Speeds
 */

scr_entity_movement_update();


/**
 * Has Reached Edge of Wall
 */

/*
scr_entity_check_wall_edges();

if (entity_at_wall_edge)
{
    key_left = !key_left;
    key_right = !key_right;
}
*/

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

if (entity_at_wall_edge)
{
    key_left = !key_left;
    key_right = !key_right;
}


/**
 * Is Colliding with Walls
 */

scr_entity_check_wall_collisions();

if (entity_hit_wall)
{
    key_left = !key_left;
    key_right = !key_right;
}


/**
 * Update Object Position
 */

x += mx;
y += my;

scr_entity_keep_in_room();

