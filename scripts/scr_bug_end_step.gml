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
velocity_x += GRAV * TICK * (gravity_factor * horizontal_gravity);
velocity_y += GRAV * TICK * (gravity_factor * vertical_gravity);

// update velocity steps
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
    
    if (vertical_gravity != 0)
    {
        // if on a floor or ceiling and hitting an eastern wall (mx > 0), switch to eastern wall (horz grav = 1)
        // if on a floor or ceiling and hitting a western wall (mx < 0), switch to western wall (horz grav = -1)
        
        temp_horizontal_gravity = sign(mx);
        temp_vertical_gravity = 0;
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
    
    if (horizontal_gravity != 0)
    {
        // if on a western or eastern wall and hitting a ceiling (my < 0), switch to ceiling (vert grav = -1)
        // if on a western or eastern wall and hitting a floor (my > 0), switch to floor (vert grav = 1);
        
        temp_horizontal_gravity = 0;
        temp_vertical_gravity = sign(my);
    }
    
    my = temp_my;
    velocity_y = 0;
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

// update gravity
horizontal_gravity = temp_horizontal_gravity;
vertical_gravity = temp_vertical_gravity;


/**
 * Update Object Position
 */

x += mx;
y += my;

