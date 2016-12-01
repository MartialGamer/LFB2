/* THIS IS NOT A SCRIPT CALLING THIS WILL DO NOTHING
=========HOW TO USE=========

===SPRITE PALETTE===
-Make a sprite of the palette you want to use:
    * First row of the palette is your basic palette
    * Each row after that is a different palette of the same sprite
    * Right now the maximum colors that can be changed is 10 per sprite.
        NOTE: This may change if I notice no changes in performance
-Make an object for palette creator:
    *In the create event of the palette creator:
        -Call the script   init_myPalette();
        -Give it the argument with the name of your palette sprite
        -Example if your palette sprite is called: charPalette
            -------IN CREATE EVENT------> init_myPalette(charPalette);
    *(OPTIONAL) In the Draw GUI event you may call   debug_myPalette();
        -This will only run if your room is called shader_test,
        or if the game is run in debug mode.
=========================================================================
        
===OBJECT TO BE RECOLORED===
-In the CREATE event of the object you want to recolor:
    *Call the script   syncPalette();
        -First argument is your palette object eg. oPalette
        -Second argument is your shader program eg. sh_recolor
        -Example:
            -------IN CREATE EVENT------>   syncPalette(oPalette,sh_recolor);
-In the STEP event of the object you want to recolor:
    *Call the script   selectColor();
        -Both arguments must be Characters like 'A' , 'B' , 'C' ... etc
        -First argument sets that character to cycle up in the palette
        -Second argument sets that character to cycle down in the palette
        -This method of control is optional:
            *The palette can be manually changed by changing the   pos   variable too.
            *Be careful as this will crash your game if you select a palette that's not there
    *Call the script   updateColor();
        -No arguments needed
-In the DRAW event of the object you want to recolor:
    *Call the    shaderOn() and    shaderOff() scripts
        -No arguments needed
        -MUST have a draw_self() or other draw event between the two to actually recolor
=========================================================================
IMPORTANT: The palette object must be created before the recolored object
=========================================================================
*/
