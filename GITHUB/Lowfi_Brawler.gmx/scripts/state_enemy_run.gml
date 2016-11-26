if state_timer == 0
{
    state_debug();
    sprite_index = asset_get_index("spr_" + string(name)+ "_run");
    image_index = 0;
    image_speed = .2;
}


// Creates Running Dust Every 10-20 frames
if rundust_timer mod rundust_range == 0 && state_timer > 3
{
    var inst = fx_create(x, y+2, spr_run_dust, .25);
    inst.image_xscale = image_xscale;
    inst.image_alpha = .8;
    
    rundust_range = irandom_range(10, 20);
    rundust_timer = 0;
}
rundust_timer += 1;

    
if hsp != 0
    image_xscale = sign(hsp);

//var choosen = choose(INSERT PLAYER AND OTHER AI HERE SOMEHOW);
//var dir = point_direction(x, y, choosen.x, choosen.y);
var dir = point_direction(x, y, obj_actor.x, obj_actor.y);  //Placeholder


hsp = clamp(hsp + lengthdir_x(movespeed, dir),-hsp_max, hsp_max);
vsp = clamp(vsp + lengthdir_y(movespeed, dir),-vsp_max, vsp_max);


if vsp > 0 
    vsp = max(0, vsp - fric);
if vsp < 0 
    vsp = min(0, vsp + fric);

if hsp > 0 
    hsp = max(0, hsp - fric);
if hsp < 0 
    hsp = min(0, hsp + fric);


collision_horizontal();

x += hsp;

collision_vertical();

y += vsp;

check_enemy_attack();

if attack
    state_switch("Attack");    


