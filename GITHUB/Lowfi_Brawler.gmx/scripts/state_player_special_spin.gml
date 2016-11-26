if state_timer == 0
{
    state_debug();
    sprite_index = asset_get_index("spr_special_placeholder");
    image_index = 0;
    image_speed = .25;
}


if image_index  >= 0 && image_index <= 1
{ 
    with instance_create(x,y,obj_hitbox_attack)
    {
        sprite_index = spr_hitbox_attack4;
        image_xscale = other.image_xscale;
        combo_count = other.combo_count;
    }
}

if state_timer > spin_frames                 //Placeholder until timer has been set up
    state_switch("Idle");


var dir = point_direction(0,0,move_hor, move_ver);

//show_debug_message(string(move_hor) + " " + string(move_ver));

if state_timer > spin_frames                 //Placeholder until timer has been set up
    state_switch("Idle");

/*    
if dir_timer == 0 {
    dir = random(360);
    dir_timer = round(sec(random(1)));
} else {
    dir_timer --;
}
*/

var dir = point_direction(0,0,move_hor, move_ver);

show_debug_message(string(move_hor) + " " + string(move_ver));

if move_hor != 0 or move_ver != 0
{
    hsp = clamp(hsp + lengthdir_x(spin_speed, dir),-hsp_spin_max, hsp_spin_max);
    vsp = clamp(vsp + lengthdir_y(spin_speed, dir),-vsp_spin_max, vsp_spin_max);
}
if move_hor == 0 && move_ver == 0
{

    if move_ver == 0
    {
    
        if vsp > 0 
            vsp = max(0, vsp - spin_fric);
        if vsp < 0 
            vsp = min(0, vsp + spin_fric);
    }
    if move_hor == 0
    {
        if hsp > 0 
            hsp = max(0, hsp - spin_fric);
        if hsp < 0 
            hsp = min(0, hsp + spin_fric);
    }
 
}

collision_horizontal();

x += hsp;

collision_vertical();

y += vsp;
