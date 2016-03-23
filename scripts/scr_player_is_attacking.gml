/**
 * Player: Is Attacking
 *
 */

if ( ! dying && ! hurting && ! attacking)
{
    // if the attack key was pressed
    //if (can_attack && key_attack_pressed)
    if (key_attack_pressed)
    {
        //can_attack = false;
        attacking = true;
        player_attack = instance_create(0, 0, obj_player_attack);
        player_attack.belongs_to = object_index;
    }
}

// if attack cooldown is active
/*if ( ! can_attack)
{
    attack_cooldown_timer += TICK;
    
    // if the timer has ended
    if (attack_cooldown_timer >= attack_cooldown_time)
    {
        can_attack = true;
        attack_cooldown_timer = 0;
    }
}*/

if (attacking)
{
    attack_timer += TICK;
    
    // if the timer has ended
    if (attack_timer >= attack_time)
    {
        attacking = false;
        attack_timer = 0;
        
        if (player_attack)
        {
            with (player_attack)
            {
                instance_destroy();
            }
        }
        player_attack = noone;
    }
}

