if place_meeting(x + hsp, y, obj_solid)
{
    while !place_meeting(x + sign(hsp), y, obj_solid)
        x += sign(hsp);
    hsp = 0;    
}
        
