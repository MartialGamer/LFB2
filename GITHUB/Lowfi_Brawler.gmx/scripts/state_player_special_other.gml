if state_timer == 0
{
    state_debug();
    sprite_index = asset_get_index("spr_special_spin");
    image_index = 0;
    image_speed = .25;
}

if !key_special 
    state_switch("Idle");
    
var dir = point_direction(0,0, move_hor, move_ver);
    

if move_hor != 0 or move_ver != 0
{
    hsp = clamp(hsp + lengthdir_x(spin_speed, dir),-hsp_roll_max, hsp_roll_max);
    vsp = clamp(vsp + lengthdir_y(spin_speed, dir),-vsp_roll_max, vsp_roll_max);
}
