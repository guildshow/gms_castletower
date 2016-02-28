/**
 * Bug: Initialize Variables
 *
 */

scr_entity_movement_vars();
speed_x = 1;
speed_y = 6;

walking = false;
jumping = false;
falling = false;
attacking = false;
hurting = false;
dying = false;

action_timer = 500;
action_time = irandom_range(200, 400);

// faux inputs
key_left = false;
key_right = false;
key_down = false;
key_jump_pressed = false;
key_jump_released = false;
key_attack_pressed = false;

// sprite animations
idle_speed = 0;
idle_sprite = spr_bug;

walking_speed = 0;
walking_sprite = spr_bug;

sprite_index = idle_sprite;
image_index = 0;
image_speed = idle_speed;


gravity_factor = 1;
vertical_gravity = true
horizontal_gravity = false;

