if state_timer == 0
{
    state_debug();
    sprite_index = asset_get_index("spr_" + string(name)+ "_attack");
    image_index = 0;
    image_speed = .25;
    
    x = round(x);
    y = round(y);
    
    combo_count += 1;

}

if image_index  >= 1 && image_index <= 3
{ 
    with instance_create(x,y,obj_hitbox_attack)
    {
        sprite_index = spr_hitbox_attack;
        image_xscale = other.image_xscale;
        combo_count = other.combo_count;
    }
}


if attack
    combo = true;

if image_index == image_number -1
{
    if combo = true
        state_switch("Attack2");
    else
        state_switch("Idle");
        
    combo = false;
}


    

