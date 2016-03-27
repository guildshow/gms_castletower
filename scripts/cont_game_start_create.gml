/**
 * Game Start Controller: On Create
 *
 * Set Global Variables
 * The "cont_game_start" is a persistent object that gets added
 * in the creation code of "rm_initialize" when the game begins.
 */

/*
    RIGHT - used when calculating the x speed of entities
    LEFT - used when calculating the x speed of entities
    TICK - the amount of time that has passed since the last step
    GRAV - the gravity
    TILE_SIZE - the default tile size
    GAME_HAS_FOCUS - whether the game window has focu
*/

globalvar RIGHT, LEFT, TICK, GRAV, TILE_SIZE, GAME_HAS_FOCUS;

RIGHT = 1;
LEFT = -1;
TICK = 1;
GRAV = 0.3;
TILE_SIZE = 16;
GAME_HAS_FOCUS = false;


/*
    MAP_ENEMIES_DESTROYED tracks which enemies in a room have been destroyed so that
    when the room reloads the enemies can check whether their unique id exist in the map,
    if so then they will destroy themselves when the room starts.
    
    LIST_ENEMIES_DESTROYED is used to check whether another room besides the current room
    or the previous room has data in MAP_ENEMIES_DESTROYED. If so, that data is removed from
    both the ds_map and the ds_list. This prevents enemies destroyed in the current room and
    the previous room from respawning but allows them to respawn once the player has moved
    several rooms away.
    
    MAP_ENEMIES_DESTROYED - a ds_map to track which enemies have been destroyed
    LIST_ENEMIES_DESTROYED - a ds_list of room ids being used as keys in MAP_ENEMIES_DESTROYED
*/

globalvar MAP_ENEMIES_DESTROYED, LIST_ENEMIES_DESTROYED;

MAP_ENEMIES_DESTROYED = ds_map_create();
LIST_ENEMIES_DESTROYED = ds_list_create();


/*
    CURRENT_DOOR_CODE
    CURRENT_ROOM_NAME
    PREVIOUS_DOOR_CODE
    PREVIOUS_ROOM_NAME
*/

globalvar CURRENT_DOOR_CODE, CURRENT_ROOM_NAME, PREVIOUS_DOOR_CODE, PREVIOUS_ROOM_NAME;

CURRENT_DOOR_CODE = '';
CURRENT_ROOM_NAME = '';
PREVIOUS_DOOR_CODE = '';
PREVIOUS_ROOM_NAME = '';


/*
    VIEW_WIDTH  - the width of each Room's View/Port
    VIEW_HEIGHT - the height of each Room's View/Port
    BG_COLOR - the background color of each Room
*/

globalvar VIEW_WIDTH, VIEW_HEIGHT, BG_COLOR;

VIEW_WIDTH = 400;
VIEW_HEIGHT = 240;
BG_COLOR = make_color_rgb(25, 25, 25); //c_black;

// resize game window at start
// *or set the Width/Height of the first room (under the Settings tab)
//var width = 500;
//var height = 500;
//window_set_size(width, height);
//window_center();

