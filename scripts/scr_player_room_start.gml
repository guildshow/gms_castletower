/**
 * Player: On Room Start
 *
 */

// search for the door the player should exit from
with (obj_door)
{
    if (door_code == CURRENT_DOOR_CODE)
    {
        other.x = x;
        other.y = y - other.sprite_height;
    }
}



/**
 * Update Camera Position
 */

// start camera on the player
fnt_update_camera(x, y, false);
