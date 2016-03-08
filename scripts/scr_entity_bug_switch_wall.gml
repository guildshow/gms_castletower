///scr_entity_bug_switch_wall()

/**
 * Change Gravity and Rotate the Object
 *
 * If the object was previously on the ground but now isn't, it must have walked off
 * the edge of a wall. Depending on the direction of gravity and the edge the object
 * has fallen off, switch gravity to force the object to "fall" back towards the wall.
 */

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

// if on the floor
if (temp_gravity_y == 1)
{
    image_angle = 0;
}
// else, if on the ceiling
else if (temp_gravity_y == -1)
{
    image_angle = 180;
}
// else, if on the eastern wall
else if (temp_gravity_x == 1)
{
    image_angle = 90;
}
// else, if on the western wall
else if (temp_gravity_x == -1)
{
    image_angle = -90;
}


/**
 * Push the Object towards the "ground" after being Rotated
 *
 * The "ground" is whatever wall is beneath the object after being rotated.
 * The walking speed and force of gravity on the object will have caused it to fall away from a wall.
 * If not pushed back, it'll appear to jump magically into the air when changing sides.
 */

if (temp_gravity_x != 0)
{
    // push object towards the western or eastern wall
    var temp_mx = sign(temp_gravity_x) * 10;
    if (place_meeting(x + mx + temp_mx, y + my, obj_wall))
    {
        temp_mx = 0;
        while ( ! place_meeting(x + mx + temp_mx + sign(temp_gravity_x), y + my, obj_wall))
        {
            temp_mx += sign(temp_gravity_x);
        }
    }
    
    mx += temp_mx;
    velocity_x = 0;
}

if (temp_gravity_y != 0)
{
    // push down towards the floor or ceiling
    var temp_my = sign(temp_gravity_y) * 10;
    if (place_meeting(x + mx, y + my + temp_my, obj_wall))
    {
        temp_my = 0;
        while ( ! place_meeting(x + mx, y + my + temp_my + sign(temp_gravity_y), obj_wall))
        {
            temp_my += sign(temp_gravity_y);
        }
    }
    
    my += temp_my;
    velocity_y = 0;
}


/**
 * Push the Object "forward" after being Rotated
 *
 * "forward" is the direction the object is now facing after being rotated.
 * Just rotating the object makes it appear to have slipped backwards after changing sides.
 * The object needs to be moved forward around half its width to appear to have smoothly
 * transitioned from one wall to another.
 */

var dir_x = 0;
var dir_y = 0;

if (facing == LEFT)
{
    if (temp_gravity_x == 1)
    {
        dir_x = 0;
        dir_y = 1;
    }
    else if (temp_gravity_y == -1)
    {
        dir_x = 1;
        dir_y = 0;
    }
    else if (temp_gravity_x == -1)
    {
        dir_x = 0;
        dir_y = -1;
    }
    else if (temp_gravity_y == 1)
    {
        dir_x = -1;
        dir_y = 0;
    }
}
else if (facing == RIGHT)
{
    if (temp_gravity_x == -1)
    {
        dir_x = 0;
        dir_y = 1;
    }
    else if (temp_gravity_y == -1)
    {
        dir_x = -1;
        dir_y = 0;
    }
    else if (temp_gravity_x == 1)
    {
        dir_x = 0;
        dir_y = -1;
    }
    else if (temp_gravity_y == 1)
    {
        dir_x = 1;
        dir_y = 0;
    }
}

var push_forward = abs(sprite_width / 2);
var temp_mx = push_forward * dir_x;
var temp_my = push_forward * dir_y;

// push the object forward half its width (or until it hits a wall)
if (place_meeting(x + mx + temp_mx, y + my + temp_my, obj_wall))
{
    temp_mx = 0;
    temp_my = 0;
    
    while ( ! place_meeting(x + mx + temp_mx + sign(dir_x), y + my + temp_my + sign(dir_y), obj_wall))
    {
        temp_mx += sign(dir_x);
        temp_my += sign(dir_y);
    }
}
mx += temp_mx;
my += temp_my;

/** /
if (dir_x == 1 && dir_y == 0) {
    show_debug_message(string(x) + ", " + string(mx) + ", " + string(push_x));
    show_debug_message(string(y) + ", " + string(my) + ", " + string(push_y));
    gravity_factor = 0;
    key_left = false;
    key_right = false;
}
/**/

