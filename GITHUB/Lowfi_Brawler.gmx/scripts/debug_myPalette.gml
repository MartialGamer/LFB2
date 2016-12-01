///Display colors
//Put me in Draw GUI event of the palette object
//Only runs in shader_test room or debug mode *For debugging*
if((room == shader_test)||debug_mode)
{
    draw_set_color(c_black);
    
    draw_text(16,16,"Testing draw");
    var yy = 0;
    var xx = 0
    for(var i = 0; i < sprite_height; i++)
    {
        for(var j = 0; j < sprite_width; j++)
        {
            curCol = make_colour_rgb(
            color_get_red(cArray[i,j]),
            color_get_green(cArray[i,j]),
            color_get_blue(cArray[i,j]));
            draw_set_color(curCol);
            r = string(color_get_red(cArray[i,j]));
            g = string(color_get_green(cArray[i,j]));
            b = string(color_get_blue(cArray[i,j]));
            draw_rectangle(32+xx-16,32+yy,32+xx,32+yy+16,false);
            draw_text(32+xx, 32+yy,string(r + " " + g + " " + b));
            xx += 128
        }
        yy+= 32;
        xx = 0;
    }
}
