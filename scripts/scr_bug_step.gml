/**
 * Tiny Spider: On Update
 *
 */

// is object standing on a wall
//grounded = place_meeting(x, y + 1, obj_wall);
grounded = place_meeting(x, y + (gravity_factor), obj_wall);


/**
 * Check Object State
 */

//scr_tiny_spider_update_action();
scr_tiny_spider_is_walking();


/**
 * Update Object Sprite
 */

//scr_entity_update_image_xscale();

if (facing == RIGHT)
{
    image_xscale = 1;
}
else if (facing == LEFT)
{
    image_xscale = -1;
}

// if ontop of or onbottom of
if (gravity_factor == 1)
{
    image_yscale = 1;
}
else if (gravity_factor == -1)
{
    image_yscale = -1;
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

