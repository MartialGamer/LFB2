///playerObjSync(obj paletteObject, shader shaderName)
//Call this in your player create event to initialize shader stuffs

palette = argument0.cArray;
colNum = array_length_2d(palette,0);
pos = 0;
posPrev = -1;
posMAX = array_height_2d(palette);
con = 255;
myShader = argument1;

passToShader(argument1);
