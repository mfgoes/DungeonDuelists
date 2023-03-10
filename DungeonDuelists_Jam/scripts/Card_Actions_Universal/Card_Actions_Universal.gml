//these are slightly more flexible and not player specific: they can be used by any player. 

function check_win_condition() {

/// @desc check who is winning. 

//check if player won
var count_destroyed = 0; 
for (var h = 0; h < array_length(opponent_card_set); h++) {
	if opponent_card_set[h].state = card_state.destroyed {
		count_destroyed +=1; 
	}
}
if count_destroyed = array_length(opponent_card_set) {
	winner = 1; //player wins	
} else {
	
//check if opponent won
count_destroyed = 0; 
for (var h = 0; h < array_length(card_set); h++) {
	if card_set[h].state = card_state.destroyed {
		count_destroyed +=1; 
	}
}
if count_destroyed = array_length(card_set) {
	winner = 2; //opponent wins	
}
}
if winner > 0 && !instance_exists(oGameOver) {
	dd = instance_create_depth(0,0,0,oGameOver);
	dd.winner = winner; 
}

}