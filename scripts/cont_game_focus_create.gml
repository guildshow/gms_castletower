/**
 * Game Focus Controller: Initialize Variables
 *
 * Loaded at the start of the game. Also loaded anytime the window loses focus.
 */

// if the game didn't just start
if ( ! GAME_JUST_STARTED)
{
    // deactivate everything but this object
    instance_deactivate_all(true);
}

