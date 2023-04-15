/// @description draw button 

if (live_call()) return live_result;
var RES = global.TEXT_RES;
draw_set_halign(fa_center);
draw_set_alpha(btn_alpha);

//show text
switch GameManager.winner {
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
draw_text((x)*RES,(y-4)*RES,text);


//show extra stuff on game over screen: 
var destroyed = 0; 
for (var h = 0; h < array_length(GameManager.player_card_set); h++) {
	if GameManager.player_card_set[h].state = card_state.destroyed {
		destroyed +=1; 
	}
}
var cards_total = array_length(GameManager.player_card_set); 
var cards_left = cards_total - destroyed;	
draw_text(x*RES,(y+10)*RES,"cards left: " + string(cards_left) + "/" + string(cards_total)); 


//reset
draw_set_alpha(1);
draw_set_halign(fa_left);