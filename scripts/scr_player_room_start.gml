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
        other.y = y + floor((sprite_height - other.sprite_height) / 2);
        can_use_door = false;
    }
}


/**
 * Update Camera Position
 */

// start camera on the player
fnt_update_camera(x, y, false);




show_debug_message("--------------------");
show_debug_message("MAP_DESTROYED_INSTANCES");

var map_size = ds_map_size(MAP_DESTROYED_INSTANCES) ;
var map_key = ds_map_find_first(MAP_DESTROYED_INSTANCES);
for (var i = 0; i < map_size; i++;)
{
    var val = ds_map_find_value(MAP_DESTROYED_INSTANCES, map_key);
    show_debug_message("  room: " + string(map_key));
    
    if (ds_exists(val, ds_type_list))
    {
        for (j = 0; j < ds_list_size(val); j++)
        {
            value = ds_list_find_value(val, j);
            show_debug_message("    " + string(value));
        }
    }
    else
    {
        show_debug_message('not a list');
    }
    
    map_key = ds_map_find_next(MAP_DESTROYED_INSTANCES, map_key);
    
}
show_debug_message("--------------------");

