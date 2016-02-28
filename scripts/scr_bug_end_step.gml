/**
 * Bug: On End of Update
 *
 */

temp_vertical_gravity = vertical_gravity;
temp_horizontal_gravity = horizontal_gravity;

/**
 * Update Movement Speeds
 */

// apply gravity
velocity_y += GRAV * TICK * gravity_factor;

/*
if (vertical_gravity)
{
    velocity_y += GRAV * TICK * gravity_factor;
}
else if (horizontal_gravity)
{
    velocity_x += GRAV * TICK * gravity_factor;
}
*/

/*
// apply horizontal restrictions
if (max_velocity_x != 0)
{
    velocity_x = clamp(velocity_x, -max_velocity_x, max_velocity_x);
}

// apply vertical restrictions
if (max_velocity_y != 0)
{
    velocity_y = clamp(velocity_y, -max_velocity_y, max_velocity_y);
}
*/

velocity_x = clamp(velocity_x, -10, 10);
velocity_y = clamp(velocity_y, -10, 10);

// new x/y positions
//mx = velocity_x * TICK;
//my = velocity_y * TICK;

if (vertical_gravity)
{
    mx = velocity_x * TICK;
    my = velocity_y * TICK;
}
else if (horizontal_gravity)
{
    mx = velocity_y * TICK;
    my = velocity_x * TICK;  
}

// store velocities
last_velocity_x = mx;
last_velocity_y = my;


/**
 * Has Reached Edge of Wall
 * /

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

// check horizontal collision
if (place_meeting(x + mx, y, obj_wall))
{
    temp_mx = 0;
    while ( ! place_meeting(x + temp_mx + sign(mx), y, obj_wall))
    {
        temp_mx += sign(mx);
    }
    
    // switch gravity towards the wall
    if (vertical_gravity)
    {
        // if moving right
        if (sign(mx) > 0)
        {
            gravity_factor = 1;
        }
        // else, if moving left
        else if (sign(mx) < 0)
        {
            gravity_factor = -1;
        }
        
        temp_vertical_gravity = false;
        temp_horizontal_gravity = true;
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
    
    // switch gravity towards the floor or ceiling
    if (horizontal_gravity)
    {
        // if moving DOWN
        if (sign(my) > 0)
        {
            gravity_factor = 1;
        }
        // else, if moving UP
        else if (sign(my) < 0)
        {
            gravity_factor = -1;
        }
        
        temp_vertical_gravity = true;
        temp_horizontal_gravity = false;
    }
    
    my = temp_my;
    velocity_y = 0;
}

/*if (entity_hit_wall)
{
    key_left = !key_left;
    key_right = !key_right;
}*/


/**
 * If Entity Will have Walked off Ledge
 */

//if ( ! place_meeting(x + last_velocity_x, y + last_velocity_y, obj_wall))
//if ( ! place_meeting(x + mx + sign(last_velocity_x), y + my + sign(last_velocity_y), obj_wall))
if ( ! grounded && prev_grounded)
{
    if (vertical_gravity)
    {
        // if on the floor
        if (gravity_factor == 1)
        {
            // if falling off the right side
            if (sign(mx) > 0)
            {
                // switch to the west wall
                gravity_factor = -1;
            }
            // else, if falling off the left side
            else if (sign(mx) < 0)
            {
                // switch to the east wall
                gravity_factor = 1;
            }
            temp_vertical_gravity = false;
            temp_horizontal_gravity = true;
        }
        
        // else, if on the ceiling
        else if (gravity_factor == -1)
        {
            // if falling of the right side
            if (sign(mx) < 0)
            {
                // switch to the east wall
                gravity_factor = 1;
            }
            // else, if falling of the left side
            if (sign(mx) > 0)
            {
                // switch to the west wall
                gravity_factor = -1;
            }
            temp_vertical_gravity = false;
            temp_horizontal_gravity = true;
        }
    }
    
    else if (horizontal_gravity)
    {
        // if on the west wall
        if (gravity_factor == -1)
        {
            // if falling off the right side
            if (sign(my) > 0)
            {
                // switch to the ceiling
                gravity_factor = -1;
            }
            // if falling off the left side
            else if (sign(my) < 0)
            {
                // switch to the floor
                gravity_factor = 1;
            }
            temp_vertical_gravity = true;
            temp_horizontal_gravity = false;
        }
        
        // else, if on the east wall
        else if (gravity_factor == 1)
        {
            // if falling off the right side
            if (sign(my) < 0)
            {
                // switch to the floor
                gravity_factor = 1;
            }
            // else, if falling off the left side
            if (sign(my) > 0)
            {
                // switch to the ceiling
                gravity_factor = -1;
            }
            temp_vertical_gravity = true;
            temp_horizontal_gravity = false;
        }
    }
    
    //mx = last_velocity_x;
    //my = last_velocity_y;
}


/**
 * Update Object Position
 */

x += mx;
y += my;

vertical_gravity = temp_vertical_gravity;
horizontal_gravity = temp_horizontal_gravity;


