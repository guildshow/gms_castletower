/**
 * Door: Initialize Variables
 *
 */

door_text = 'PRESS UP'
show_text = false;

can_use_door = true;
disabled_time = 60; // 2 seconds
disabled_timer = 0;

/*
    door_code
     This door's unique identifier. Used to find where to start the player when the room with this door loads.
    
    exit_door_code
     The door_code to search for when entering a room.
    
    exit_room_name
     The name of the room to load.
*/

door_code = '01';
exit_door_code = '01';
exit_room_name = 'rm_level_2';

