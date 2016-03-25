///fnt_update_room_data(object id);

var room_id = room;
var object_id = argument0;

// locate this room in the ds_map
var map_value = ds_map_find_value(MAP_DESTROYED_INSTANCES, room_id); // (ds_map, key);

// if the room does not exist (is <undefined>)
if (is_undefined(map_value))
{
    show_debug_message('new list of objects: ' + string(room_id) + ', ' + string(object_id));
    
    // create a ds_list and add the object to it
    var list_objects = ds_list_create();
    ds_list_add(list_objects, object_id);
    
    // add the ds_list of objects to the ds_map using the room as the key
    ds_map_add(MAP_DESTROYED_INSTANCES, room_id, list_objects);
}

// else, the room does exist
else
{
    // is the map value a ds_list
    if (ds_exists(map_value, ds_type_list))
    {
        // locate this object in the list
        var list_index = ds_list_find_index(map_value, object_id);
        
        // if the object does not exist in the list
        if (list_index == -1)
        {
            ds_list_add(map_value, object_id);
            show_debug_message('add object to list: ' + string(room_id) + ', ' + string(object_id));
        }
        else
        {
            show_debug_message('object already exist in list: ' + string(room_id) + ', ' + string(object_id));
        }
    }
    else
    {
        show_debug_message('not a ds_list: ' + string(room_id));
    }
}

