///fnt_check_enemies_destroyed(object id);

/**
 * Check If Enemy Already Destroyed
 *
 * Check the global ds_map MAP_ENEMIES_DESTROYED for a ds_list, indexed
 * by the current room's id, and check if the object's id is present.
 */

var room_id = room;
var object_id = argument0;

// locate the value in the ds_map indexed by the room's id
var map_value = ds_map_find_value(MAP_ENEMIES_DESTROYED, room_id); // (ds_map, key);

// if the value does exist (is not <undefined>)
if ( ! is_undefined(map_value))
{
    // if the value is a ds_list
    if (ds_exists(map_value, ds_type_list))
    {
        // locate the index of the object's id in the ds_list
        var list_index = ds_list_find_index(map_value, object_id);
        
        // if the object's id exist in the ds_list
        if (list_index != -1)
        {
            return true;
        }
    }
}

return false;

