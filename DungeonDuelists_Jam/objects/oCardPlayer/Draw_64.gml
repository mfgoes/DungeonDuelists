/// @description draw card texts
if (live_call()) return live_result;

var RES = global.TEXT_RES;
draw_set_halign(fa_center);

//draw based on struct
if instance_exists(oConstructorTest) 
{
	var name = oConstructorTest.hand_set[card_number].name;
	var atk = oConstructorTest.hand_set[card_number].attack;
	var def = oConstructorTest.hand_set[card_number].defense;
	draw_set_alpha(image_alpha)
	draw_set_font(fnt_Bold);
	draw_text(x*RES,(y-3)*RES,name);
	draw_set_font(fnt_BodyRegular);
	draw_text(x*RES,(y-30)*RES,"atk: " + string(atk));
	draw_text(x*RES,(y+26)*RES,"def: " + string(def));

}

//reset text settings
draw_set_halign(fa_left);
draw_set_alpha(1); 