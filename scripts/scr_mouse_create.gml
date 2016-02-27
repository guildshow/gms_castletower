/**
 * Mouse: Initialize Variables
 *
 */

scr_entity_movement_vars();
speed_x = 2.5;
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
idle_speed = 0.05;
idle_sprite = spr_mouse_idle;

walking_speed = 0.3;
walking_sprite = spr_mouse_walking;

sprite_index = idle_sprite;
image_index = 0;
image_speed = idle_speed;


