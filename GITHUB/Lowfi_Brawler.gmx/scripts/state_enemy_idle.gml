if state_timer == 0
{
    state_debug();
    sprite_index = asset_get_index("spr_" + string(name)+ "_idle");
    image_index = 0;
    image_speed = .1;
    
    x = round(x);
    y = round(y);
}

var dis = distance_to_object(obj_actor);

if dis < 20
    state_switch("Run");
    
if dis < 5
    state_switch("Attack");  
