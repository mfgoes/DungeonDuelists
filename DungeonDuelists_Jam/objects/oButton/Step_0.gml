/// @description Insert description here
//hover animation
if (position_meeting(mouse_x, mouse_y, id)) {
	{
		image_index = 1;	
		btn_alpha = 0.7;
	}
} else {
	image_index = 0;
	btn_alpha = 1;
}

//clicking button
if (position_meeting(mouse_x, mouse_y, id)) && mouse_check_button_pressed(mb_left) {
	
	play_sound_btn(); 
	switch btn_type {
		case (0): { //destroy card
			with GameManager {
				destroy_card_on_field_random(); 	
			}
		}
		break;
		case (1): { //start battle if you have a monster ready
			if GameManager.first_move = true && !instance_exists(oMonsterPlayer) {
				if !instance_exists(oUI_CardToast) {
					dd = instance_create_depth(x,y+30,0,oUI_CardToast); 
					dd.str = "add monsters to board to start"; 
				}
			}
			else {
				// Determine who should start
		        with(GameManager) {
					determine_attack_order(); 
					battle_started = true;	
				}
			}
	    }
		break;
		case (2): {	//attack
			with(GameManager)
				attack_opponent();
		}
		break;
		case (3): {	//restart
			deck_shuffle(player_card_set);
			room_restart();
			
		}
		break;
		case (4): {	//go to next level
			if room_next(room) != -1
			room_goto_next();
			//with(GameManager) 
			//	spawn_opponent_monster(); 
		}
		break;
		case (5): {	//pick card player test
			with(GameManager) {
				battle_started = false; 
				determine_attack_order(); 
				show_debug_message("game paused"); 
			}
		}
		break;
	}
}