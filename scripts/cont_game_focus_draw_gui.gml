/**
 * Game Focus Controller: On Draw GUI
 *
 */

var txt = 'THE GAME HAS BEEN PAUSED#CLICK TO UNPAUSE';
if (GAME_JUST_STARTED)
{
    txt = 'CLICK TO START GAME';
}

// draw pause screen text
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_04b03_gui);
if (GAME_JUST_STARTED)
{
    draw_text(window_get_width() / 2, window_get_height() / 2, txt);
}
else
{
    draw_text(view_wview[0] / 2, view_hview[0] / 2, txt);
}

