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
velocity_x += GRAV * TICK * horizontal_gravity_factor;
velocity_y += GRAV * TICK * vertical_gravity_factor;

// update step velocities
mx = velocity_x * TICK;
my = velocity_y * TICK;  

// apply horizontal/vertical restrictions
velocity_x = clamp(velocity_x, -10, 10);
velocity_y = clamp(velocity_y, -10, 10);

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
            horizontal_gravity_factor = base_gravity_factor;
        }
        // else, if moving left
        else if (sign(mx) < 0)
        {
            horizontal_gravity_factor = -base_gravity_factor;
        }
        vertical_gravity_factor = 0;
        
        temp_horizontal_gravity = true;
        temp_vertical_gravity = false;
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
            vertical_gravity_factor = base_gravity_factor;
        }
        // else, if moving UP
        else if (sign(my) < 0)
        {
            vertical_gravity_factor = -base_gravity_factor;
        }
        horizontal_gravity_factor = 0;
        
        temp_horizontal_gravity = false;
        temp_vertical_gravity = true;
    }
    
    my = temp_my;
    velocity_y = 0;
}


/**
 * If Entity Will have Walked off Ledge
 */

//if ( ! place_meeting(x + last_velocity_x, y + last_velocity_y, obj_wall))
//if ( ! place_meeting(x + mx + sign(last_velocity_x), y + my + sign(last_velocity_y), obj_wall))
if ( ! grounded && prev_grounded)
{
    show_debug_message("horz: " + string(horizontal_gravity) + ", " + string(sign(horizontal_gravity_factor)) );
    show_debug_message("vert: " + string(vertical_gravity) + ", " + string(sign(vertical_gravity_factor)) );
    show_debug_message("----");

    if (vertical_gravity)
    {
        // if on the floor
        if (sign(vertical_gravity_factor) == 1)
        {
            // if falling off the right side
            if (sign(mx) > 0)
            {
                // switch to the west wall
                horizontal_gravity_factor = -base_gravity_factor;
            }
            // else, if falling off the left side
            else if (sign(mx) < 0)
            {
                // switch to the east wall
                horizontal_gravity_factor = base_gravity_factor;
            }
            vertical_gravity_factor = 0;
            
            temp_horizontal_gravity = true;
            temp_vertical_gravity = false;
        }
        
        // else, if on the ceiling
        else if (sign(vertical_gravity_factor) == -1)
        {
            // if falling of the right side
            if (sign(mx) < 0)
            {
                // switch to the east wall
                horizontal_gravity_factor = base_gravity_factor;
            }
            // else, if falling of the left side
            if (sign(mx) > 0)
            {
                // switch to the west wall
                horizontal_gravity_factor = -base_gravity_factor;
            }
            vertical_gravity_factor = 0; 
            
            temp_horizontal_gravity = true;
            temp_vertical_gravity = false;
        }
    }
    
    else if (horizontal_gravity)
    {
        // if on the west wall
        if (sign(horizontal_gravity_factor) == -1)
        {
            
            // if falling off the right side
            if (sign(my) > 0)
            {
                // switch to the ceiling
                vertical_gravity_factor = -base_gravity_factor;
            }
            // if falling off the left side
            else if (sign(my) < 0)
            {
                // switch to the floor
                vertical_gravity_factor = base_gravity_factor;
            }
            horizontal_gravity_factor = 0;
            
            temp_horizontal_gravity = false;
            temp_vertical_gravity = true;
        }
        
        // else, if on the east wall
        else if (sign(horizontal_gravity_factor) == 1)
        {
            // if falling off the right side
            if (sign(my) < 0)
            {
                // switch to the floor
                vertical_gravity_factor = base_gravity_factor;
            }
            // else, if falling off the left side
            if (sign(my) > 0)
            {
                // switch to the ceiling
                vertical_gravity_factor = -base_gravity_factor;
            }
            horizontal_gravity_factor = 0;
            
            temp_horizontal_gravity = false;
            temp_vertical_gravity = true;
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

