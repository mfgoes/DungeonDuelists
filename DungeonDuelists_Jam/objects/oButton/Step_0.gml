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
	switch btn_type {
		case (0): { //destroy card
			with GameManager {
				destroy_card_on_field_random(); 	
			}
		}
		break;
		case (1): { //start battle
			/* //old code
			with(GameManager) {
				
				//determine who should start
				if turn_to_play = 0 { //player turn
					increase_mana(1); 
					draw_card_player();
					attack_opponent();
					turn_to_play = 1;
				}
				//draw_card = false; //reset drawing cards
			}*/
			
			// Determine who should start
	        with(GameManager) {
				determine_attack_order(); 
				
				/*
		        if player_total_power <= opponent_total_power
		            turn_to_play = 0;
		        else
		            turn_to_play = 1;
				*/
				battle_started = true;	
			}
	    }
		break;
		case (2): {	//attack
			with(GameManager)
				attack_opponent();
		}
		break;
		case (3): {	//restart
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
			with(GameManager) 
				draw_card_player(); 
				increase_mana(1); 
		}
		break;
	}
}