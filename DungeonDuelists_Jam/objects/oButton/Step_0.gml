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
			with(oConstructorTest) turn_to_play = !turn_to_play; 
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
			if room_next(room) != -1
				room_goto_next();
		}
		break;
	}
}