/// @description interaction
if (live_call()) return live_result;

//smooth enter
if entrance_anim = true {
var spd = card_number; if card_number > 3 spd = 3; //set max animation speed 
y = lerp(y,ystart,0.03*(3 - spd*0.5));
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
	
	//check if you have enough mana. also check monsters on board
	var mana_cost = oConstructorTest.card_set[card_number].attack;
	var monsters_on_board = instance_number(oMonsterPlayer); 
	
	if oConstructorTest.coins_player >= mana_cost && monsters_on_board < 3 {
		if card_active = false {
			card_active = true;
			oConstructorTest.card_set[card_number].state = 2; //2 = on field
			alarm[0] = 20;
			oConstructorTest.coins_player-=mana_cost; 
		}
	}
	else {
		//write that it's too expensive
		dd = instance_create_depth(0,0,0,oUI_CardToast); 
		dd.str = "not enough mana"; if monsters_on_board = 3 dd.str = "too many monsters on board"; 
	}
}

//anim if card is active
if card_active = true {
	if image_alpha > 0 
		image_alpha -=0.05;	
}


