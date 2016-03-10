/**
 * Tiny Spider: Is Attacking
 *
 */

if ( ! dying && ! hurting)
{
    if (place_meeting(x, y, obj_player))
    {
        with (obj_player)
        {
            is_colliding_with = other.object_index;
        }
    }
}

