/**
 * Door: On Update
 *
 */

// reset variable
show_text = false;

if (can_use_door)
{
    // if overlapping with the player object
    if (place_meeting(x, y, obj_player))
    {
        show_text = true;
        
        // if the UP key was released
        if (keyboard_check_released(vk_up))
        {
            io_clear();
            
            // check if the room exist
            var room_id = asset_get_index(exit_room_name);
            if (room_exists(room_id))
            {
                // update globals
                PREVIOUS_DOOR_CODE = CURRENT_DOOR_CODE;
                PREVIOUS_ROOM_NAME = CURRENT_ROOM_NAME;
                CURRENT_DOOR_CODE = exit_door_code;
                CURRENT_ROOM_NAME = exit_room_name;
                
                // switch rooms
                room_goto(room_id);
            }
        }
    }
}

if ( ! can_use_door)
{
    image_alpha = 0.5;
    disabled_timer += TICK;
    
    // if the timer has ended
    if (disabled_timer >= disabled_time)
    {
        image_alpha = 1.0;
        can_use_door  = true;
        disabled_timer = 0;
    }
}

