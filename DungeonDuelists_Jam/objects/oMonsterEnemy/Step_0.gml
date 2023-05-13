/// @description Insert description here
if (live_call()) return live_result;
timer_init("attack_time"); 
timer_init("attack_end"); 
	
	
#region attacks
	if attack_turn = true && anim_end = false { //attack the enemies. timing depends on spawn number. 
		
		if timer_get("attack_time") <= 0 {
			timer_set("attack_time", card_number * 10 + 5); //to do: fix this
			attack_turn = false;	
			//play_sound_atk(); 
		}
	}

	#region attack animation
		if timer_get("attack_time") = 0 {
			start_attack = true; 
			attack_target_player();
		
		}

		if start_attack = true {
			var x2 = xstart - 20; 
			x = lerp(x,x2,0.5);
			if round(x) = x2 {
				anim_end = true; 
				start_attack = false;
			}
		}
	#endregion

#endregion

#region attack / entrance animation
	if entrance_anim = true or anim_end = true {
	x = lerp(x,xstart,0.1);
	if round(x) = xstart {
		entrance_anim = false; //exit animation
		anim_end = false; start_attack = false;
		}
	}
	if image_alpha < 1 image_alpha +=0.05; 
#endregion

#region flash animation
	// If the flash_timer is greater than 0, decrease it
	if (flash_timer > 0) {
	    flash_timer--;
	}
#endregion