/// @description draw the toast
draw_set_halign(fa_center);
var RES_T = global.RES_TEXT; 
var RES = global.RES_GUI;
draw_text_transformed(_x*RES,_y*RES,str,RES_T,RES_T,10);
