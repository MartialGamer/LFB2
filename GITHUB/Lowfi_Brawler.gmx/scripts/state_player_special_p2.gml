if state_timer == 0
{
    state_debug();
    sprite_index = asset_get_index("spr_p2_fire");
    image_index = 0;
    image_speed = 0;

    fx_create(x + (6*image_xscale), y-8,spr_explode,.6);
}
if state_timer = 6
{
    with instance_create(x + (5*image_xscale),y - 8, obj_bullet)
    {
        image_xscale = other.image_xscale;
    }    
    image_index = 1;
    
}


if state_timer = 10
    image_speed = .4;


if floor(image_index) = image_number-1
    state_switch("Idle");




    


