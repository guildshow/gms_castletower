/**
 * Player Attack: On Animation End
 *
 * Pauses the animation on the last frame and prevents it from looping.
 */

if (image_speed != 0)
{
    image_speed = 0;
    image_index = image_number - 1;
}

