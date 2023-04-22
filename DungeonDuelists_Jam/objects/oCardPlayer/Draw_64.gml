/// @description draw card texts
if (live_call()) return live_result;

var RES = global.RES_GUI;
var RES_T = global.RES_TEXT; 
draw_set_halign(fa_center);

//draw based on struct
if instance_exists(GameManager) 
{
	var name = GameManager.player_card_set[card_number].name; //was hand set
	var atk = GameManager.player_card_set[card_number].attack;
	var def = GameManager.player_card_set[card_number].defense;
	var cost = GameManager.player_card_set[card_number].cost;
	draw_set_alpha(image_alpha)
	draw_set_font(GameManager.font_bold);
	draw_text_transformed(x*RES,(y-3)*RES,name,RES_T,RES_T,0);
	draw_set_font(GameManager.font);
	draw_text_transformed(x*RES,(y-30)*RES,"atk: " + string(atk),RES_T,RES_T,0);
	draw_text_transformed(x*RES,(y+26)*RES,"HP: " + string(def),RES_T,RES_T,0);
	draw_text_transformed(x*RES,(y+6)*RES,"$: " + string(cost),RES_T,RES_T,0);
}

//reset text settings
draw_set_halign(fa_left);
draw_set_alpha(1); 