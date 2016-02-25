/**
 * Mouse: On Update
 *
 */

/*
// faux object input
key_left = true;//keyboard_check(vk_left);
key_right = false;//keyboard_check(vk_right);
key_down = false;//keyboard_check(vk_down);
key_jump_pressed = false;//keyboard_check_pressed(vk_space);
key_jump_released = false;//keyboard_check_released(vk_space);
key_attack_pressed = false;//keyboard_check_released(ord("Z"));
*/

// is object standing on a wall
grounded = place_meeting(x, y + 1, obj_wall);


/**
 * Check Object State
 */

//scr_player_is_crouching();
//scr_player_is_jumping();
//scr_player_is_attacking();
scr_mouse_is_walking();


/**
 * Update Object Sprite
 */

scr_entity_update_image_xscale();

// update the sprite and animation speed
if (walking)
{
show_debug_message(string(sprite_index) + " " + string(walking_sprite));
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


