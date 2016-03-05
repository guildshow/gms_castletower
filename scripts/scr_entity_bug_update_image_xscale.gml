///scr_entity_bug_update_image_xscale()

/**
 * Update the Direction the Object is Facing
 *
 * Include in the Step Event of an object.
 * Rotate the sprite based on the direction of gravity.
 */

// if on the floor
if (vertical_gravity == 1)
{
    image_angle = 0;
}
// else, if on the ceiling
else if (vertical_gravity == -1)
{
    image_angle = 180;        
}
// else, if on the eastern wall
else if (horizontal_gravity == 1)
{
    image_angle = 90;
}
// else, if on the western wall
else if (horizontal_gravity == -1)
{
    image_angle = -90;
}

scr_entity_update_image_xscale();

