/**
 * Game Start Controller: On Update
 *
 */

// update the amount of time that has passed since the last frame
TICK = 60 / 1000000 * delta_time;

// if ESC or P key is pressed
if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("P")))
{
    // add the Pause Screen
    instance_create(0, 0, cont_pause_screen);
}

