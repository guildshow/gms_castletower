/**
 * Mouse: On End of Update
 *
 */


/**
 * Update Movement Speeds
 */

scr_entity_movement_update();


/**
 * Is Colliding with Walls
 */

scr_entity_check_wall_collisions();

if (entity_hit_wall)
{
    key_left = !key_left;
    key_right = !key_right;
}


/**
 * Update Object Position
 */

x += mx;
y += my;

scr_entity_keep_in_room();

