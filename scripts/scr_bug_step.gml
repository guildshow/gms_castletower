/**
 * Bug: On Update
 *
 */

// is object standing on a wall
previously_grounded = grounded;
if (vertical_gravity != 0)
{
    grounded = place_meeting(x, y + sign(vertical_gravity), obj_wall);
}
else if (horizontal_gravity != 0)
{
    grounded = place_meeting(x + sign(horizontal_gravity), y, obj_wall); 
}


/**
 * Check Object State
 */

scr_bug_is_walking();


/**
 * Update Object Sprite
 *
 */

scr_entity_bug_update_image_xscale()


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

