/**
 * Door: On Update
 *
 */

show_text = false;

if (place_meeting(x, y, obj_player))
{
    show_text = true;
    
    if (keyboard_check_released(vk_up))
    {
        io_clear();
        show_debug_message('door code: ' + string(door_code));
        show_debug_message('exit door code: ' + string(exit_door_code));
        show_debug_message('exit room name: ' + string(exit_room_name));
        
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

