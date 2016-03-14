/**
 * Game Focus Controller: On Draw
 *
 */

// draw a black rectangle over the scene
draw_set_color(c_black);
if (GAME_JUST_STARTED)
{
    draw_rectangle(0, 0, window_get_width(), window_get_height(), 0);
}
else
{
    draw_rectangle(view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], 0);
}

