/// @description Insert description here
if (live_call()) return live_result;

var RES =global.RES_GUI;
var RES_T = global.RES_TEXT;
draw_set_halign(fa_center);
draw_set_font(GameManager.font);

if instance_exists(GameManager) 
{
	var card_id = card_number;
	var atk = GameManager.opponent_card_set[card_number].attack;
	var def = GameManager.opponent_card_set[card_number].defense;
	var hp_max = GameManager.opponent_card_set[card_number].hp_max;
	
	draw_set_alpha(image_alpha)
	if (global.debugmode) 
		draw_text(x*RES,y*RES,card_id);
	draw_text_transformed(x*RES,(y-20)*RES,"atk: " + string(atk),RES_T,RES_T,0);
	draw_text_transformed(x*RES,(y+26)*RES,"hp: " + string(def) + "/" + string(hp_max),RES_T,RES_T,0);

}


//reset text settings
draw_set_halign(fa_left);
draw_set_alpha(1); 