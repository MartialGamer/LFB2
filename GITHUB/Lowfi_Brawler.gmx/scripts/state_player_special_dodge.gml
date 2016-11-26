if state_timer == 0
{
    state_debug();
    sprite_index = asset_get_index("spr_bimmy_idle");
    image_index = 0;
    image_speed = .25;

}

//Dust
if rundust_timer mod rundust_range == 0
{
    var inst = fx_create(x - (4 * move_hor),y+2 - (move_ver),spr_run_dust,.25);
    inst.image_xscale = image_xscale;
    inst.image_alpha = .8;
    
    rundust_range = irandom_range(1,6);
    rundust_timer = 0;
}
rundust_timer += 1;

if state_timer >= dodge_frames
    state_switch("Idle");

if state_timer > dodge_frames / 2 && state_timer < dodge_frames    
    if special
        state_switch("Special2");
        
var dir = point_direction(0, 0, -image_xscale, 0);

hsp = clamp(hsp + lengthdir_x(dodge_speed, dir),-hsp_dodge_max, hsp_dodge_max);

if vsp > 0 
    vsp = max(0, vsp - dodge_fric);
if vsp < 0 
    vsp = min(0, vsp + dodge_fric);

if hsp > 0 
    hsp = max(0, hsp - dodge_fric);
if hsp < 0 
    hsp = min(0, hsp + dodge_fric);
    

collision_horizontal();

x += hsp;

collision_vertical();

y += vsp;

