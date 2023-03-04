/// @description draw arrays

if (live_call()) return live_result;
draw_set_halign(fa_left);

//UI deck cards
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
		var _text = "in hand" 
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

//Draw card slots


for (var i = 0; i < array_length(card_slots); i++) 
{
	var _y = room_height * global.TEXT_RES - 100 + 20* i;
	draw_text(_x,_y,"slots: " + string(card_slots[i])); 
}
