if state_timer == 0
{
    state_debug();
    sprite_index = asset_get_index("spr_" + string(name)+ "_attack2");;
    image_index = 0;
    image_speed = .2;
    
    x = round(x);
    y = round(y);
    
    combo_count += 1;
}

if image_index  >= 0 && image_index <= 1
{ 
    with instance_create(x,y,obj_hitbox_attack)
    { 
        sprite_index = spr_hitbox_attack;
        image_xscale = other.image_xscale;
        combo_count = other.combo_count;
    }
}


if image_index == image_number -1
    state_switch("Idle");

if attack
    combo = true;

if image_index == image_number -1
{
    if combo = true
        state_switch("Attack3");
    else
        state_switch("Idle");
        
    combo = false;
}

