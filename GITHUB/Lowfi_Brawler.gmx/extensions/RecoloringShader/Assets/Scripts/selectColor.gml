///selectColor
//Takes 2 char arguments, first char cycles selection up, second char cycles down
if(keyboard_check_pressed(ord(argument0)))
{
    if(pos-1 < 0) pos = posMAX-1;
    else
    pos--;
}
if(keyboard_check_pressed(ord(argument1)))
{
    if(pos+1 >= posMAX) pos = 0;
    else
    pos++;
}

