
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
for (var h = 0; h < array_length(player_card_set); h++) {
	if player_card_set[h].state = card_state.destroyed {
		count_destroyed +=1; 
	}
}
if count_destroyed = array_length(player_card_set) {
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
	
	if attack_turn = 0 {   // 1st turn
		if (turn_to_play == 0) {
	        // Handle player's turn logic
			if timer_get("player_turn") <= 0 {
	            attack_opponent();
	            timer_set("player_turn", 50 + irandom(25));
			
				if !instance_exists(oMonsterPlayer) && first_move != true { //skip to enemy turn if you don't spawn anything	
					 timer_set("player_turn", 10);
				}
	        }
			if timer_get("player_turn") = 1 {
				increase_mana(1); 
				turn_to_play = 1;
	            timer_set("player_turn", -1);
	        }
	    }
		 else { // 2nd turn
	       if timer_get("opponent_turn") <= 0 {
				attack_player_init();
				timer_set("opponent_turn", 50 + irandom(15));
			}
			if timer_get("opponent_turn") = 1 {
				timer_set("opponent_turn", -1);
				// Spawn enemy monsters (move somewhere else)
				spawn_opponent_monster();
				draw_card_player(); 
				//battle_started = false;
				turn_to_play = 0;
				attack_turn = 1;			//TESTING
	        }
		}
	} else
	if attack_turn = 1 {  //opponent starts
		if (turn_to_play == 0) { // 1st turn
			if timer_get("opponent_turn") <= 0 {
				attack_player_init();
				timer_set("opponent_turn", 50 + irandom(25));
			}
			if timer_get("opponent_turn") = 1 {
				timer_set("opponent_turn", -1);
				turn_to_play = 1;
	        }
	     }
		 else { // 2nd turn
	        if timer_get("player_turn") <= 0 {
	            attack_opponent();
	            timer_set("player_turn", 50 + irandom(25));
			
				if !instance_exists(oMonsterPlayer) && first_move != true { //skip to enemy turn if you don't spawn anything	
					 timer_set("player_turn", 10);
				}
	        }
			if timer_get("player_turn") = 1 {
				//no spawns
				timer_set("player_turn", -1);
				// Spawn enemy monsters (move somewhere else)
				if first_move != true && instance_number(oMonsterEnemy) = 0
					spawn_opponent_monster();
				draw_card_player(); 
				//battle_started = false;
				turn_to_play = 0;
	           
	        }
		 }
	} 
	
	
	// Check win condition
	check_win_condition();
	show_debug_message("Turn has changed: {0}", turn_to_play);	
}


function process_turnv2() {
    // Alternate the turn_to_play variable between 0 and 1
    turn_to_play = 1 - turn_to_play;

    if (turn_to_play == 0) {
        // Handle player's turn logic
        if timer_get("player_turn") <= 0 {
            attack_opponent();
            timer_set("player_turn", 100 + irandom(25));

            if !instance_exists(oMonsterPlayer) && first_move != true {
                timer_set("player_turn", 10);
            }
        }
        if timer_get("player_turn") == 1 {
            increase_mana(1);
            timer_set("player_turn", -1);
        }
    } else {
        // Handle opponent's turn logic
        if timer_get("opponent_turn") <= 0 {
            attack_player_init();
            timer_set("opponent_turn", 100 + irandom(15));
        }
        if timer_get("opponent_turn") == 1 {
            timer_set("opponent_turn", -1);
            // Spawn enemy monsters (move somewhere else)
            spawn_opponent_monster();
            draw_card_player();
            //battle_started = false;
        }
    }

    // Check win condition
    check_win_condition();
    show_debug_message("Turn has changed: {0}", turn_to_play);
}


/// @function                CalculateTotalPower(player_card_set)
/// @description             Calculate the total power (Attack + Defense) of all monsters on the board for the given card set.
/// @param {Array}           player_card_set   The array of monster cards for a player or opponent, with each card having attack, defense, and state attributes.
/// @return {Number}                     The total power of all monsters on the board for the given card set.

function CalculateTotalPower(argument0) {
	 var total_power = 0;
	 var set_array = argument0; 
 
    for (var i = 0; i < array_length(set_array); ++i)
    {
        if (set_array[i].state == card_state.on_field)
        {
            total_power += set_array[i].defense; //set_array[i].attack +
        }
    }

    return total_power;
}

function determine_attack_order() {
    var player_total_power = CalculateTotalPower(player_card_set);
    var opponent_total_power = CalculateTotalPower(opponent_card_set);

    if (player_total_power < opponent_total_power) {
        attack_turn = 0; // Set attack_turn to player
    } else {
        attack_turn = 1; // Set attack_turn to opponent
    }
	
	//player always starts on the first turn
	if (first_move) {
		attack_turn = 0; 
		first_move = false; 	
	}
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
		hand_set[h] = player_card_set[h];
		player_card_set[h].state = card_state.in_hand; 
	}*/
}
	
	
function update_game_level() {
	//very quick way to change game levels (changes deck)
	if room = Room2 {
		game_level = 2; 
	}
	if room = Room3 {
		game_level = 3; 
	}
}
	
	
function flash_monster(monster) {
    monster.flash_timer = monster.flash_duration;
}