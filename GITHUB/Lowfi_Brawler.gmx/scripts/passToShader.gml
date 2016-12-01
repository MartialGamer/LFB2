//Don't call this directly, this is called by another script
//Passes arguments to shader
hnd_colNum = shader_get_uniform(argument0, "colorNum");
hnd_colorI = shader_get_uniform(argument0, "colorIn");
hnd_colorO = shader_get_uniform(argument0, "colorOut");

for(var i = 0; i < (colNum*4); i+=4)
{
    for(var j = 0; j < colNum; j++)
    {
        //store all colors in that row
        colorI[i+0] = color_get_red(palette[0,j])/con;
        colorI[i+1] = color_get_green(palette[0,j])/con;
        colorI[i+2] = color_get_blue(palette[0,j])/con;
        colorI[i+3] = 1.0
        i += 4; //Mega hack.. ;_;
    }
}
