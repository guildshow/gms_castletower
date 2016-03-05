///scr_entity_bug_movement_update()

/**
 * Update Object Movement Speeds
 *
 * Include in the End Step Event of an object.
 */

// apply gravity
velocity_x += GRAV * TICK * (gravity_factor * horizontal_gravity);
velocity_y += GRAV * TICK * (gravity_factor * vertical_gravity);

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

// new x/y positions
mx = velocity_x * TICK;
my = velocity_y * TICK;

// store velocities
last_velocity_x = mx;
last_velocity_y = my;

