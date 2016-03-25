///fnt_check_room_data(object id);

var room_id = room;
var object_id = argument0;

// locate this room in the ds_map
var map_value = ds_map_find_value(MAP_DESTROYED_INSTANCES, room_id); // (ds_map, key);

// if the room exist
if ( ! is_undefined(map_value))
{
    // is the map_value a ds_list
    if (ds_exists(map_value, ds_type_list))
    {
        // locate this object in the list
        var list_index = ds_list_find_index(map_value, object_id);
        
        // if the object exist in the list
        if (list_index != -1)
        {
            return true;
        }
    }
}

return false;

