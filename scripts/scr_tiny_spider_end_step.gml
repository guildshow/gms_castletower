/**
 * Tiny Spider: On End of Update
 *
 */


/**
 * Update Movement Speeds
 */

scr_entity_bug_movement_update();


/**
 * Update Gravity
 */

scr_entity_bug_update_gravity();


/**
 * Update Object Position
 */

x += mx;
y += my;

scr_entity_keep_in_room();

