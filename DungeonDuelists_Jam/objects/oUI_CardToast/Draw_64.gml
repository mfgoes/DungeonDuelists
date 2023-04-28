/// @description draw the toast
draw_set_halign(fa_center);
var RES_T = global.RES_TEXT; 
var RES = global.RES_GUI;

if toast_type = variant.normal {
	draw_set_font(GameManager.font); 
	draw_text_transformed(_x*RES,_y*RES,str,RES_T,RES_T,0);
}
if toast_type = variant.damage {
	var size = lerp(1,0.3,alarm[1] / 60); 
	draw_set_font(GameManager.font_bold); 
	col_dmg1 = make_colour_rgb(225,122,132); 
	col_dmg2 = make_colour_rgb(217,87,99); 
	
	if alarm[1] <= 0 {
		draw_set_color(col_dmg2);
	}
	else {
		draw_set_color(col_dmg1);
	}
	
	draw_text_transformed(_x*RES,_y*RES,str,size,size,0);
	draw_set_color(c_white); 
}