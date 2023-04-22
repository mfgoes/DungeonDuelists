/// @description Insert description here
//if (live_call()) return live_result;

var RES =global.RES_GUI;
draw_set_halign(fa_center);


if instance_exists(GameManager) 
{
	var name = GameManager.player_card_set[card_number].name;
	var atk = GameManager.player_card_set[card_number].attack;
	var def = GameManager.player_card_set[card_number].defense;
	var hp_max = GameManager.player_card_set[card_number].hp_max;
	
	draw_set_alpha(image_alpha)
	//draw_text(x*RES,y*RES,name);
	draw_text(x*RES,(y-20)*RES,"atk: " + string(atk));
	if (global.debugmode) 
		draw_text(x*RES,(y)*RES,"no: " + string(card_number) + ", " + string(spawn_number));
	draw_text(x*RES,(y+26)*RES,"hp: " + string(def) + "/" + string(hp_max));

}


//reset text settings
draw_set_halign(fa_left);
draw_set_alpha(1); 