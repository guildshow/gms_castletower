/**
 * Player: On Update
 *
 */

// get the player's input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_down = keyboard_check(vk_down);
key_jump_pressed = keyboard_check_pressed(ord("X")); // vk_space
key_jump_released = keyboard_check_released(ord("X"));
key_attack_pressed = keyboard_check_released(ord("Z"));

// is object standing on a wall
grounded = place_meeting(x, y + 1, obj_wall);


/**
 * Check Object State
 */

scr_player_is_hurting();
scr_player_is_crouching();
scr_player_is_jumping();
scr_player_is_attacking();
scr_player_is_walking();


/**
 * Update Object Sprite
 */

scr_entity_update_image_xscale();

/*
// update the sprite and animation speed
if (hurting)
{
    if (sprite_index != hurting_sprite)
    {
        sprite_index = hurting_sprite;
        image_index = 0;
        image_speed = hurting_speed;
    }
}
else if (jumping || falling)
{
    if (sprite_index != jumping_sprite)
    {
        sprite_index = jumping_sprite;
        image_index = 0;
        image_speed = jumping_speed;
    }
}
else if (walking)
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



reduce_health_timer += TICK;
if (reduce_health_timer >= reduce_health_time)
{
    current_health -= 1;
    if (current_health < 0)
    {
        current_health = maximum_health;
    }
    reduce_health_timer = 0;
}

