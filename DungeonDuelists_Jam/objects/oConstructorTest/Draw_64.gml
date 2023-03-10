/// @description draw arrays

if (live_call()) return live_result;
draw_set_halign(fa_left);


if (global.debugmode) {
	//UI player cards
	var _x = 10;
	var _x2 = 155; 

	draw_set_font(fnt_Bold);
	draw_text( _x,10,"Your Deck:"); 

	draw_set_font(fnt_BodyRegular);
	for (var i = 0; i < array_length(card_set); i++) 
	{
		var _y = 30 + 20* i;
		var _item = card_set[i];
		if card_set[i].state = card_state.in_hand  {
			var _text = "- hand" 
			draw_set_color(c_white);
			draw_text(_x+_x2,_y,_text);
		}
		else
		if card_set[i].state = card_state.on_field  {
			var _text = "on field" 
			draw_set_color(c_aqua);
			draw_text(_x+_x2,_y,_text);
		}
		else
		if card_set[i].state = card_state.destroyed  {
			var _text = "destroyed" 
			draw_set_color(c_orange);
			draw_text(_x+_x2,_y,_text);
		}
		else
			draw_set_color(c_white);
		draw_text(_x,_y,string(_item.name + ", atk: " + string(_item.attack))); 
	}


	//draw slots
	for (var i = 0; i < array_length(card_slots_opponent); i++) 
	{
		var _y = room_height * global.TEXT_RES - 100 + 20* i;
		draw_text(_x,_y,"E slots: " + string(card_slots_opponent[i])); 
	}
	
	
	//UI Opponent cards
	var _x = room_width * global.TEXT_RES-10;
	var _y = 10;

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
		if opponent_card_set[i].state = card_state.in_deck str1 = "deck - ";	
		if opponent_card_set[i].state = card_state.on_field str1 = "field - ";
		if opponent_card_set[i].state = card_state.destroyed str1 = "graveyard - ";
		draw_text(_x,_y2,str1 + string(_item.name) + ", atk: " + string(_item.attack)); 
	
	}
	
	//write that it's debugmode
	draw_set_halign(fa_left);
	draw_set_alpha(0.7);
	draw_text(8,room_height*RES-20,"Debug mode is on");
	draw_set_alpha(1);
}



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
//reset
draw_set_font(fnt_BodyRegular);





