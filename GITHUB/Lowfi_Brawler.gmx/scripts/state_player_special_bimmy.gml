if state_timer == 0
{
    state_debug();
    sprite_index = asset_get_index("spr_bimmy_roll");
    image_index = 0;
    image_speed = .25;

}

if rundust_timer mod rundust_range == 0
{
    var inst = fx_create(x - (4 * move_hor),y+2 - (move_ver),spr_run_dust,.25);
    inst.image_xscale = image_xscale;
    inst.image_alpha = .8;
    
    rundust_range = irandom_range(1,6);
    rundust_timer = 0;
}
rundust_timer += 1;

if state_timer > roll_frames
    state_switch("Idle");
    
if move_hor != 0
    image_xscale = move_hor;
else
    if move_ver == 0 && state_timer < 5
        move_hor = image_xscale;
        
var dir = point_direction(0,0,move_hor, move_ver);    
show_debug_message(string(move_hor) + " " + string(move_ver));

if move_hor != 0 or move_ver != 0
{
    hsp = clamp(hsp + lengthdir_x(roll_speed, dir),-hsp_roll_max, hsp_roll_max);
    vsp = clamp(vsp + lengthdir_y(roll_speed, dir),-vsp_roll_max, vsp_roll_max);
}
if move_hor == 0 && move_ver == 0
{

    //approach(vsp, 0, roll_fric);
    //approach(hsp, 0, roll_fric);
    if move_ver == 0
    {
    
        if vsp > 0 
            vsp = max(0, vsp - roll_fric);
        if vsp < 0 
            vsp = min(0, vsp + roll_fric);
    }
    if move_hor == 0
    {
        if hsp > 0 
            hsp = max(0, hsp - roll_fric);
        if hsp < 0 
            hsp = min(0, hsp + roll_fric);
    }
 
}

collision_horizontal();

x += hsp;

collision_vertical();

y += vsp;

check_attack();
