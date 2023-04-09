/// @description Insert description here
if (live_call()) return live_result;

var RES = global.TEXT_RES;
draw_set_halign(fa_center);


if instance_exists(GameManager) 
{
	var card_id = card_number;
	var atk = GameManager.opponent_card_set[card_number].attack;
	var def = GameManager.opponent_card_set[card_number].defense;
	draw_set_alpha(image_alpha)
	if (global.debugmode) 
		draw_text(x*RES,y*RES,card_id);
	draw_text(x*RES,(y-20)*RES,"atk: " + string(atk));
	draw_text(x*RES,(y+26)*RES,"hp: " + string(def) + "/" + string(def));

}


//reset text settings
draw_set_halign(fa_left);
draw_set_alpha(1); 