/// @description interaction
if (live_call()) return live_result;

//smooth enter
if entrance_anim = true {
y = lerp(y,ystart,0.03*(3 - card_number*0.5));
if round(y) = ystart entrance_anim = false; //exit animation
if image_alpha < 1 image_alpha +=0.03; 
}
else if card_active = false 
{
	//hover animation
	if (position_meeting(mouse_x, mouse_y, id)) && entrance_anim = false {
		{
			y = lerp(y,ystart-5,0.4); 
			image_alpha = 0.8; 
		}
	} else {
		y = lerp(y,ystart,0.3); 
		image_alpha = 1; 
	}
}

//activate card (deleting this object)
if mouse_check_button_pressed(mb_left) && (position_meeting(mouse_x, mouse_y, id))  {
	if card_active = false {
		card_active = true;
		oConstructorTest.hand_set[card_number].state = 2; //2 = on field
		alarm[0] = 20;
		
	}
}

//anim if card is active
if card_active = true {
	if image_alpha > 0 
		image_alpha -=0.05;	
}

