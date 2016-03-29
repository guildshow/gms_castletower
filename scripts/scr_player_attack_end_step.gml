/**
 * Player Attack: On End of Update
 *
 */

// if this instance belongs to another
if (belongs_to != noone)
{
    // reposition to that instance
    image_xscale = belongs_to.image_xscale;
    x = belongs_to.x;
    y = belongs_to.y;
}

