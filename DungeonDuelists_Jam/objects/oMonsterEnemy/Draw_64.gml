/// @description Insert description here
if (live_call()) return live_result;

var RES = global.TEXT_RES;
draw_set_halign(fa_center);


if instance_exists(oConstructorTest) 
{
	var name = card_number;
	var atk = oConstructorTest.opponent_hand_set[card_number].attack;
	var def = oConstructorTest.opponent_hand_set[card_number].defense;
	draw_set_alpha(image_alpha)
	draw_text(x*RES,y*RES,name);
	draw_text(x*RES,(y-20)*RES,"atk: " + string(atk));
	draw_text(x*RES,(y+26)*RES,"def: " + string(def) + "/" + string(def));

}


//reset text settings
draw_set_halign(fa_left);
draw_set_alpha(1); 