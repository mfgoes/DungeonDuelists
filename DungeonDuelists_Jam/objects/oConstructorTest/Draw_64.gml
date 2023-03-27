/// @description draw arrays
draw_set_halign(fa_left);
var RES = global.TEXT_RES;

if (global.debugmode) {
	//UI player cards
	var _x = 10;
	var _x2 = 155; 
	var _ymain = 100; 

	draw_set_font(fnt_Bold);
	draw_text( _x,_ymain,"Your Deck:"); 

	draw_set_font(fnt_BodyRegular);
	for (var i = 0; i < array_length(card_set); i++) 
	{
		var _y = _ymain + 20 + 20* i;
		var _item = card_set[i];
		if card_set[i].state = card_state.in_hand  {
			var _text = "- hand" 
			draw_set_color(c_yellow);
			draw_text(_x+_x2,_y,_text);
		}
		else
		if card_set[i].state = card_state.on_field  {
			var _text = "- field" 
			draw_set_color(c_aqua);
			draw_text(_x+_x2,_y,_text);
		}
		else
		if card_set[i].state = card_state.destroyed  {
			var _text = "destroyed" 
			draw_set_color(c_orange);
			draw_text(_x+_x2,_y,_text);
		} else
		if card_set[i].state = card_state.in_deck  {
			var _text = "- deck" 
			draw_set_color(c_white);
			draw_text(_x+_x2,_y,_text);
		}
		
		draw_set_color(c_white);
		draw_text(_x,_y,string(_item.name + ", atk: " + string(_item.attack))); 
	}

	if (live_call()) return live_result;
	//draw slots
	for (var i = 0; i < array_length(card_slots_opponent); i++) 
	{
		var _y = room_height * global.TEXT_RES - 100 + 20* i;
		draw_text(room_width,_y,"E slots: " + string(card_slots_opponent[i])); 
	}
	
	
	//UI Opponent cards
	var _x = room_width * global.TEXT_RES-10;
	var _y = 100;

	draw_set_halign(fa_right);
	draw_set_font(fnt_Bold);
	draw_text( _x,_y,"Opponent Deck:"); 

	draw_set_font(fnt_BodyRegular);
	for (var i = 0; i < array_length(opponent_card_set); i++) 
	{
		_y2 = _y + 20 + 20* i;
		var str1 = "__ ";
		var _item = opponent_card_set[i];
		if opponent_card_set[i].state = card_state.in_hand str1 = "hand - ";	
		if opponent_card_set[i].state = card_state.in_deck {
			draw_set_color(c_white);
			str1 = "deck - ";	
		}
		if opponent_card_set[i].state = card_state.on_field {
			draw_set_color(c_aqua);
			str1 = "field - ";
		}
		if opponent_card_set[i].state = card_state.destroyed str1 = "graveyard - ";
		draw_text(_x,_y2,str1 + string(_item.name) + ", atk: " + string(_item.attack)); 
	
	}
	
	//write that it's debugmode
	draw_set_halign(fa_left);
	draw_set_alpha(0.7);
	draw_text(8,room_height*RES-20,"Debug mode is on");
	draw_set_alpha(1);
	
	//draw available cards
	var available_cards = array_length(card_set); //subtract unavailable cards		
	for (var h = 0; h < array_length(card_set); h++) {
		if (card_set[h].state = card_state.in_hand)
		or (card_set[h].state = card_state.on_field)
		or (card_set[h].state = card_state.destroyed)
		{
			available_cards -=1; 
		}
	} if available_cards = 0 draw_set_color(c_red) else draw_set_color(c_white);
	draw_text(140,room_height*RES-20,"Available cards: " + string(available_cards)); 
}
draw_set_color(c_white);


//draw turns
if winner = 0 {
	draw_set_halign(fa_center);
	draw_set_font(fnt_Bold);
	var str = "_" 
	var _x = room_width*RES / 2;
	var _y = 10*RES; 
	if turn_to_play = 0 {
		str = "Player turn"; 
		m = lerp(m,40,0.2); 
	}
	else {
		str = "Opponents turn"; 
		m =  lerp(m,50,0.2); 
	}
	draw_text(_x,_y,str);

	draw_rectangle(_x-m,_y+20,_x+m,_y+21,0);
	//draw_sprite_ext(button_primary_empty,0,_x,_y+8,RES,RES,0,c_white,1);
}

#region draw HP
	//draw HP player
	var width = sprite_get_width(heart_icon) * RES + 5; 
	var _x = 20;
	var _x2 = (room_width-width*3)*RES; 
	var _y = 20;
	var ind = 0; //image_index 

	for (var i = 0; i < HP_max; i++) {
		if player_HP > i ind = 0 else ind = 1; 
		draw_sprite_ext(heart_icon,ind,_x+i*width,_y,RES,RES,0,c_white,1); 
	}

	//draw HP opponent
	var ind = 0; //image_index 
	for (var i = 0; i < HP_max_opponent; i++) {
		if opponent_HP > i ind = 2 else ind = 1; 
		draw_sprite_ext(heart_icon,ind,_x2+i*width,_y,RES,RES,0,c_white,1); 
	}
#endregion 

#region draw coins 
	var _x = 20;
	var _x2 = (room_width-width*3)*RES; 
	var _y = 50; 
	var _width2 = sprite_get_width(coin_mana) * RES + 5; 
	draw_set_halign(fa_left);
	for (var i = 0; i < coins_player; i++) {
		draw_sprite_ext(coin_mana,0,_x+i*_width2,_y,RES,RES,0,c_white,1); 
	} 
	
	for (var i = 0; i < coins_opponent; i++) {
		draw_sprite_ext(coin_mana,0,_x2+i*_width2,_y,RES,RES,0,c_white,1); 
	} 

#endregion 


#region draw cards left
	var _y = 70;
	var destroyed = 0; 
	for (var h = 0; h < array_length(oConstructorTest.card_set); h++) {
		if oConstructorTest.card_set[h].state = card_state.destroyed {
			destroyed +=1; 
		}
	}
	var cards_total = array_length(oConstructorTest.card_set); 
	var cards_left = cards_total - destroyed;	
	draw_set_font(fnt_BodyRegular);
	draw_text(_x,_y,"Deck: " + string(cards_left) + "/" + string(cards_total)); 

#endregion

//reset






