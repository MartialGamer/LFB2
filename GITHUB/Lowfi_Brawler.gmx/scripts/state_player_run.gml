if state_timer == 0
{
    state_debug();
    sprite_index = spr_bimmy_run;
    image_index = 0;
    image_speed = .2;
}

if move_hor == 0 && move_ver == 0
    state_switch("Idle");

var dir = point_direction(0,0,move_hor, move_ver);    
        
hsp = clamp(hsp + lengthdir_x(movespeed, dir),-hsp_max, hsp_max);
vsp = clamp(vsp + lengthdir_y(movespeed, dir),-vsp_max, vsp_max);

if move_ver == 0
{
    if vsp > 0 
        vsp = max(0, vsp - fric);
    if vsp < 0 
        vsp = min(0, vsp + fric);
}
if move_hor == 0
{
    if hsp > 0 
        hsp = max(0, hsp - fric);
    if hsp < 0 
        hsp = min(0, hsp + fric);
}


collision_horizontal();

x += hsp;

collision_vertical();

y += vsp;

check_attack();


