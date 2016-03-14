/**
 * Game Focus Controller: On Update
 *
 * Unpause the game if the window is cliked with the left mouse.
 */

if ( ! WINDOW_FOCUS)
{
    if (mouse_check_button_pressed(mb_left))
    {
        WINDOW_FOCUS = true;
        
        // activate everything
        instance_activate_all();
        
        if (GAME_JUST_STARTED)
        {
            GAME_JUST_STARTED = false;
            room_goto_next();
        }
        
        // destroy this object
        instance_destroy();
    }
}


