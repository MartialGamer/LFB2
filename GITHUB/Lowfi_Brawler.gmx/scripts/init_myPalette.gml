///recolor(sprite_index of palette)
/*-------------------------------------------------
Put me in the Create event of the palette object
and feed me the palette sprite like:
init_palette_obj(myPalette);
-------------------------------------------------*/
//Palette
sprite_index = argument0;
image_alpha = 0;

for(var i = 0; i < sprite_height ; i++)
{
    for(var j = 0; j < sprite_width; j++)
    {
        cArray[i,j] = -1;
    }
}

var palSurf = surface_create(sprite_width,sprite_height);

//create surface and draw pallete to it
if (!surface_exists(palSurf))
{
    palSurf = surface_create(sprite_width,sprite_height);
    surface_set_target(palSurf);
    draw_clear_alpha(c_black, 0);
    draw_sprite(argument0,0,0,0);
    for(var i = 0; i < sprite_height; i++)
    {
        for(var j = 0; j < sprite_width; j++)
        {
            cArray[i,j] = surface_getpixel(palSurf,j,i);
        }
    }
}
else
{
    surface_set_target(palSurf);
    draw_clear_alpha(c_black, 0);
    draw_sprite(argument0,0,0,0);
    for(var i = 0; i < sprite_height; i++)
    {
        for(var j = 0; j < sprite_width; j++)
        {
            cArray[i,j] = surface_getpixel(palSurf,j,i);
        }
    }
}
surface_free(palSurf);
