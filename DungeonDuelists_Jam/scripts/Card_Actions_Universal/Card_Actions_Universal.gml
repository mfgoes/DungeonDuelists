
/// @function                check_win_condition()
/// @description             Checks if either the player or the opponent has won the game by destroying all the opponent's cards.
/// @return {Void}           This function does not return a value. It sets a global variable 'winner' and creates an instance of the 'oGameOver' object if a win condition is met.
function check_win_condition() {

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
	/*
	with (oButton) instance_destroy(); 
	dd = instance_create_depth(0,0,0,oGameOver);
	dd.winner = winner; 
	*/
	
	//buttons (create new buttons + delete old)
	/*with(oButton) if default_button = true {
		if btn_type = 2 or btn_type = 5 or btn_type = 1
		default_button = false; 
		instance_destroy(); 	
	}*/
	
	
}

}
	
	
function process_turn() {
	
	if (turn_to_play == 0) { //player turn 
        // Handle player's turn logic
		if timer_get("player_turn") <= 0 {
            attack_opponent();
            timer_set("player_turn", 50 + irandom(25));
			
			if !instance_exists(oMonsterPlayer) && first_move != true { //skip to enemy turn if you don't spawn anything	
				 timer_set("player_turn", 10);
			}
        }
		if timer_get("player_turn") = 1 {
			turn_to_play = 1;
            timer_set("player_turn", -1);
        }
    }
	 else { // Opponent's turn
        // Handle opponent's turn logic
		if timer_get("opponent_turn") <= 0 {
			attack_player_init();
			timer_set("opponent_turn", 50 + irandom(25));
		}
		if timer_get("opponent_turn") = 1 {
			timer_set("opponent_turn", -1);
			// Spawn enemy monsters (move somewhere else)
			spawn_opponent_monster();
			battle_started = false;
			turn_to_play = 0;
        }
	}
	// Check win condition
	check_win_condition();
	show_debug_message("Turn has changed: {0}", turn_to_play);	
}


/// @function                CalculateTotalPower(card_set)
/// @description             Calculate the total power (Attack + Defense) of all monsters on the board for the given card set.
/// @param {Array}           card_set   The array of monster cards for a player or opponent, with each card having attack, defense, and state attributes.
/// @return {Number}                     The total power of all monsters on the board for the given card set.

function CalculateTotalPower(argument0) {
	 var total_power = 0;
	 var set_array = argument0; 
 
    for (var i = 0; i < array_length(set_array); ++i)
    {
        if (set_array[i].state == card_state.on_field)
        {
            total_power += set_array[i].attack + set_array[i].defense;
        }
    }

    return total_power;
}


function deck_shuffle(argument0) {
/// @desc picks top 3 cards from deck
/// @param {real} deck The deck to shuffle
	r = array_length(argument0) - 1;
	for(var i = 0; i < r; i += 1) {
		j = irandom_range(i,r);
		temp = argument0[i];
		argument0[i] = argument0[j];
		argument0[j] = temp;
	}
}

//// @desc cards to pick up at the start of a game
/// @param {real} cards 
function Start_from_deck(argument0) {
	var num = argument0;
	hand_set =  array_create(num,0);
	repeat(num) draw_card_player(); 
	/*hand_set =  array_create(num,0);
	for (var h = 0; h < array_length(hand_set); h++) {
		hand_set[h] = card_set[h];
		card_set[h].state = card_state.in_hand; 
	}*/
}
	