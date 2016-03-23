/**
 * Player Attack: On Update
 *
 */

// if colliding with an enemy
var colliding_with = instance_place(x, y, obj_mouse);
if (colliding_with != noone)
{
    with (colliding_with)
    {
        is_colliding_with = other.object_index;
    }
}

var colliding_with = instance_place(x, y, obj_tiny_spider);
if (colliding_with != noone)
{
    with (colliding_with)
    {
        is_colliding_with = other.object_index;
    }
}

