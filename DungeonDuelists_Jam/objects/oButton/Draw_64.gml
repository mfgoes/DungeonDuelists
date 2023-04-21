/// @description draw button 

if (live_call()) return live_result;


//show text
switch btn_type {
		case (0): {
			text = "destroy card";
		}
		break;
		case (1): {
			text = "start auto battle"; //used to be called "end turn" however, since start turns change, this fits better. 
			if GameManager.battle_started = true btn_alpha = 0.5; else btn_alpha = 1; 
		}
		break;
		case (2): {
			btn_alpha = 1; 
			text = "attack";
		}
		break;
		case (3): {
			text = "restart";
		}
		break;
		case (4): {
			text = "next level";
		}
		break;
		case (5): {
			text = "pause battle";
		}
		break;
}


//HTML5 scaling

//First, calculate the scale factors for the X and Y axes:
var scaleX = display_get_width() / 840;
var scaleY = display_get_height() / 480;
var RES = global.TEXT_RES;

draw_text(30,100,scaleY); 
draw_set_halign(fa_center);
draw_set_alpha(btn_alpha);
draw_text((x)*RES,(y-4)*RES,text);
draw_set_alpha(1);
draw_set_halign(fa_left);