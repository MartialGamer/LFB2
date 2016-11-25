if state_timer == 0
{
    state_debug();
    sprite_index = asset_get_index("spr_" + string(name)+ "_idle");
    image_index = 0;
    image_speed = .1;
    
    x = round(x);
    y = round(y);
}

if move_hor != 0 or move_ver != 0
    state_switch("Run");
    
check_attack();

if special
    state_switch("Special")

