/**
 * Bug: On Update
 *
 */

// is object standing on a wall
//grounded = place_meeting(x, y + 1, obj_wall);
//grounded = place_meeting(x, y + (gravity_factor), obj_wall);
grounded = true; // should always be grounded


/**
 * Check Object State
 */

scr_bug_is_walking();


/**
 * Update Object Sprite
 */

//scr_entity_update_image_xscale();

if (vertical_gravity)
{
    image_angle = 0;
    
    // if on the floor
    if (gravity_factor == 1)
    {
        image_yscale = 1;
        
        if (facing == RIGHT)
        {
            image_xscale = 1;
        }
        else if (facing == LEFT)
        {
            image_xscale = -1;
        }
    }
    // else, if on the ceiling
    else if (gravity_factor == -1)
    {
        image_yscale = -1;
        
        if (facing == RIGHT)
        {
            image_xscale = -1;
        }
        else if (facing == LEFT)
        {
            image_xscale = 1;
        }
    }
}
else if (horizontal_gravity)
{

}

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

