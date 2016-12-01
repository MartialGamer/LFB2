///shaderOn()
/*------------------------------------------------------
I go in the DRAW EVENT of the object you want to recolor
--------------------------------------------------------*/
//Takes no arguments, sets shader and passes variable handles to it.

shader_set(myShader);
shader_set_uniform_i(hnd_colNum,colNum);
shader_set_uniform_f_array(hnd_colorI, colorI);
shader_set_uniform_f_array(hnd_colorO, colorO);

//Don't forget to draw your sprite with draw_self(),
//it has to come between shaderOn() and shaderOff()
