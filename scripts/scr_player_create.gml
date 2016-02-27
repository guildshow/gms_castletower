/**
 * Player: Initialize Variables
 *
 */

scr_entity_movement_vars();
speed_x = 2;
speed_y = 6;

walking = false;
jumping = false;
falling = false;
crouching = false;
attacking = false;
hurting = false;
dying = false;

jumps = 0;
jumpsmax = 2;

can_attack = true;
attack_cooldown_time = 240;
attack_cooldown_timer = 0;

// inputs
key_left = false
key_right = false;
key_down = false;
key_jump_pressed = false;
key_jump_released = false;
key_attack_pressed = false;

// sprite animations
idle_speed = 0.075;
idle_sprite = spr_player_idle;

jumping_speed = 0;
jumping_sprite = spr_player_jumping;

walking_speed = 0.1;
walking_sprite = spr_player_walking;

sprite_index = idle_sprite;
image_index = 0;
image_speed = idle_speed;


