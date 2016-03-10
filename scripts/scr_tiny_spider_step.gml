/**
 * Tiny Spider: On Update
 *
 */

// is object standing on a wall
previously_grounded = grounded;
if (gravity_y != 0)
{
    grounded = place_meeting(x, y + sign(gravity_y), obj_wall);
}
else if (gravity_x != 0)
{
    grounded = place_meeting(x + sign(gravity_x), y, obj_wall); 
}


/**
 * Check Object State
 */

//scr_tiny_spider_update_action();
scr_tiny_spider_is_walking();
scr_tiny_spider_is_attacking();


/**
 * Update Object Sprite
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

