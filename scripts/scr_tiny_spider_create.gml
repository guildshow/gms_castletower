/**
 * Tiny Spider: Initialize Variables
 *
 */

scr_entity_bug_movement_vars()

gravity_factor = 1;
speed_x = 1;
speed_y = 6;

walking = false;
jumping = false;
falling = false;
attacking = false;
hurting = false;
dying = false;

damage = 1;

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
idle_sprite = spr_tiny_spider_idle;

walking_speed = 0.3;
walking_sprite = spr_tiny_spider_walking;

sprite_index = idle_sprite;
image_index = 0;
image_speed = idle_speed;
image_angle = 0;

