//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

//I'm limiting the number of colors we can change for now to 10 (Performance concerns?)
const int maxcolors = 10;

//Don't mess with these variables!
uniform int colorNum;
uniform vec4 colorIn[maxcolors];
uniform vec4 colorOut[maxcolors];



void main()
{
    //regular pass through
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    //compare colors, change with equivalent if needed
    for (int i = 0; i < colorNum; i++)
    {
        if (gl_FragColor == colorIn[i])
        {
            gl_FragColor = colorOut[i];
        }
    }
}

