/// @description draw button 

if (live_call()) return live_result;

//show text
switch oConstructorTest.winner {
		case (0): {
			text = "Game Over";
		}
		break;
		case (1): {
			text = "You Win!";
		}
		break;
		case (2): {
			text = "You Lost...";
		}
		break;
}


var RES = global.TEXT_RES;
draw_set_halign(fa_center);
draw_set_alpha(btn_alpha);
draw_text((x)*RES,(y-4)*RES,text);

draw_set_alpha(1);
draw_set_halign(fa_left);