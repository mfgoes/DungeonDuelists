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
			with oConstructorTest {
				destroy_card_on_field_random(); 	
			}
		}
		break;
		case (1): { //end turn
			with(oConstructorTest) {
				draw_card_player(); 
				increase_mana(1); 
				if turn_to_play = 0 {
					attack_opponent();
					turn_to_play = 1;
				}
				draw_card = false; //reset drawing cardss
			}
			show_debug_message("turn has changed: {0}",oConstructorTest.turn_to_play); 
		}
		break;
		case (2): {	//attack
			with(oConstructorTest)
				attack_opponent();
		}
		break;
		case (3): {	//restart
			room_restart();
		}
		break;
		case (4): {	//go to next level
			//if room_next(room) != -1
			//	room_goto_next();
			with(oConstructorTest) 
				spawn_opponent_monster(); 
		}
		break;
		case (5): {	//pick card player test
			with(oConstructorTest) 
				draw_card_player(); 
				increase_mana(1); 
		}
		break;
	}
}