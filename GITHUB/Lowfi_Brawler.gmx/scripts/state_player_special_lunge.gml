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

//Create Hitbox Object
/*if image_index  >= 0 && image_index <= 1
{ 
    with instance_create(x,y,obj_hitbox_attack)
    {
        sprite_index = spr_hitbox_attack;
        image_xscale = other.image_xscale;
        combo_count = other.combo_count;
    }
}*/

if state_timer >= lunge_frames
    state_switch("Idle");
    
var dir = point_direction(0, 0, image_xscale, 0);

hsp = clamp(hsp + lengthdir_x(lunge_speed, dir),-hsp_lunge_max, hsp_lunge_max);

if hsp > 0 
    hsp = max(0, hsp - lunge_fric);
if hsp < 0 
    hsp = min(0, hsp + lunge_fric);
    

collision_horizontal();

x += hsp;

collision_vertical();

y += vsp;

