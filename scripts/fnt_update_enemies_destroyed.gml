///fnt_update_enemies_destroyed(object id);

/**
 * Update Enemy As Destroyed
 *
 * Add the object's id to the global ds_map MAP_ENEMIES_DESTROYED.
 * Group object ids togeter into a ds_list, indexed into the ds_map by
 * the room's id.
 */

var room_id = room;
var object_id = argument0;

// locate the value in the ds_map indexed by the room's id
var map_value = ds_map_find_value(MAP_ENEMIES_DESTROYED, room_id); // (ds_map, key);

// if the value does not exist (is <undefined>)
if (is_undefined(map_value))
{
    // create a ds_list and add the object's id to it
    var object_list = ds_list_create();
    ds_list_add(object_list, object_id);
    
    // add the ds_list of object ids to the ds_map using the room's id as the key
    ds_map_add(MAP_ENEMIES_DESTROYED, room_id, object_list);
}

// else, the value does exist
else
{
    // if the value a is ds_list
    if (ds_exists(map_value, ds_type_list))
    {
        // locate the index of the object's id in the ds_list
        var list_index = ds_list_find_index(map_value, object_id);
        
        // if the object's id does not exist in the ds_list
        if (list_index == -1)
        {
            // add the object's id to the ds_list
            ds_list_add(map_value, object_id);
        }
    }
}

