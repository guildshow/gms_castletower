/**
 * Door: On Draw
 *
 */

// draw the object's sprite
draw_self();

// draw text above the door
if (show_text)
{
    var xPos = round(x);
    var yPos = round(y - sprite_height);
    
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fnt_04b03_game);
    draw_text(xPos, yPos, door_text);
    //draw_text_transformed(x, y, 'Imma Door', 0.5, 0.5, 0);
}

