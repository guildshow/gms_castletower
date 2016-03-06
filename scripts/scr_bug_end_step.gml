/**
 * Bug: On End of Update
 *
 */

// used to update gravity at the end of this script
temp_gravity_x = gravity_x;
temp_gravity_y = gravity_y;


/**
 * Update Movement Speeds
 */

scr_entity_bug_movement_update()


/**
 * Check if Colliding with Walls
 */

scr_entity_bug_check_wall_collisions();


/**
 * Check if Reached the Edge of a Wall
 */

scr_entity_bug_check_wall_edges();


/**
 * Update Gravity
 */

gravity_x = temp_gravity_x;
gravity_y = temp_gravity_y;


/**
 * Update Object Position
 */

x += mx;
y += my;

