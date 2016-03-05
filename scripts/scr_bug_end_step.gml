/**
 * Bug: On End of Update
 *
 */

// used to update gravity at the end of this script
temp_vertical_gravity = vertical_gravity;
temp_horizontal_gravity = horizontal_gravity;


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

horizontal_gravity = temp_horizontal_gravity;
vertical_gravity = temp_vertical_gravity;


/**
 * Update Object Position
 */

x += mx;
y += my;

