/**
 * Bug: On Update
 *
 */

// is object standing on a wall
prev_grounded = grounded;
if (vertical_gravity)
{
    grounded = place_meeting(x, y + vertical_gravity_factor, obj_wall);
}
else if (horizontal_gravity)
{
    grounded = place_meeting(x + horizontal_gravity_factor, y, obj_wall); 
}


/**
 * Check Object State
 */

scr_bug_is_walking();


/**
 * Update Object Sprite
 */

// rotate sprite based on the force of gravity
if (vertical_gravity)
{
    // if on the floor
    if (sign(vertical_gravity_factor) == 1)
    {
        image_angle = 0;
    }
    // else, if on the ceiling
    else if (sign(vertical_gravity_factor) == -1)
    {
        image_angle = 180;        
    }
}
else if (horizontal_gravity)
{
    // if on the east wall
    if (sign(horizontal_gravity_factor) == 1)
    {
        image_angle = 90;
    }
    // else, if on the west wall
    else if (sign(horizontal_gravity_factor) == -1)
    {
        image_angle = -90;
    }
}

/*if (facing == RIGHT)
{
    image_xscale = 1;
}
else if (facing == LEFT)
{
    image_xscale = -1;
}*/
scr_entity_update_image_xscale();


/*
// update the sprite and animation speed
if (walking)
{
    if (sprite_index != walking_sprite)
    {
        sprite_index = walking_sprite;
        image_index = 0;
        image_speed = walking_speed;
    }
}
else
{
    if (sprite_index != idle_sprite)
    {
        sprite_index = idle_sprite;
        image_index = 0;
        image_speed = idle_speed;
    }
}
*/

