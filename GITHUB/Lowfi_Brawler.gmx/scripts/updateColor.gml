///updateColor()
//No arguments
//Updates any color changes using the palette
if(posPrev == pos)
{
    exit
}
else
{
    posPrev = pos;
}
for(var i = 0; i < (colNum*4); i+=4)
{
    for(var j = 0; j < colNum; j++)
    {
        //store all colors in that row
        colorO[i+0] = color_get_red(palette[pos,j])/con;
        colorO[i+1] = color_get_green(palette[pos,j])/con;
        colorO[i+2] = color_get_blue(palette[pos,j])/con;
        colorO[i+3] = 1.0
        i += 4; //Mega hack.. part 2 ;_;
    }
}
