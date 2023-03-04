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
		case (0): {
			text = "destroy card";
			with oConstructorTest {
				destroy_card_on_field_random(); 	
			}
		}
		break;
		case (1): {
			text = "end turn";
		}
		break;
		case (2): {
			text = "restart";
		}
		break;
	}
}