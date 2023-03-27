// Script assets have changed for v2.3.0 see

/// @desc opponent deck
/// @param {integer} amount of cards
function deck_init_opponent(argument0) {
	amount = argument0;
	opponent_card_set = array_create_ext(amount, function() { return new Monster_weak();});

	//To do: create presets here. 
	
	//generate 3 weak cards 
	for (var h = 0; h < 3; h++) {
		with (opponent_card_set[h]) {
			Monster_weak();
		}
	}
	////generate 2 mid cards 
	//for (var h = 3; h < 5; h++) {
	//	with (opponent_card_set[h]) {
	//		Monster_mid();
	//	}
	//}

}

/// @desc generate hand from deck
/// @param {integer} amount of cards
function hand_init_opponent(argument0) {
	var num = argument0; 
	opponent_hand_set =  array_create(num,0);
	for (var h = 0; h < array_length(opponent_hand_set); h++) {
		opponent_hand_set[h] = opponent_card_set[h];
		opponent_card_set[h].state = card_state.in_hand; 
	}	
}



function init_card_slots_opponent() {
	 //to do: make this dynamic so it can be used by both opponent and player functions
	card_slots_opponent = array_create(3,0);
}

//// @desc spawn new opponents from deck, if possible
/// @param {real} amount 

function spawn_opponent_monster() {
    var available_cards = array_length(opponent_card_set); //available = not in_hand, destroyed, or on_field. This number will select the "correct" card for the hand.
    var card_number = 0; //which card number to put on field
    var cards_on_field = 0; //skip putting in hand first
    var first_available = -1; //initialize to an invalid index

    for (var h = 0; h < array_length(opponent_card_set); h++) {
        if (opponent_card_set[h].state == card_state.on_field) {
            card_number += 1;
            available_cards -= 1;
        }
        if (opponent_card_set[h].state == card_state.on_field) {
            cards_on_field += 1;
        }
        if (opponent_card_set[h].state == card_state.in_deck) {
            if (first_available == -1) {
                first_available = h;
            }
        }
    }
	
	//determine free positon on the field (to do: simplify this later)
	//if oConstructorTest.card_slots[0] = 0 //etc. 
	var spawn_number = 0; 
	if card_slots_opponent[0] = 0 {
		card_slots_opponent[0] = 1; // 
		spawn_number = 0;
	}
	else if card_slots_opponent[1] = 0 {
		card_slots_opponent[1] = 1; // 
		spawn_number = 1;
	}
	else if card_slots_opponent[2] = 0 {
		card_slots_opponent[2] = 1; // 	
		spawn_number = 2;
	}


    #region create the enemy
	var _x = oStageEnemy.x + 20 + 34 * spawn_number;
	var _y = oStageEnemy.y - 10; 
	
	if instance_number(oMonsterEnemy) < 3 {
	var card_number = 0; //deck ID
		 if (first_available >= 0) && cards_on_field < 8 { //don't spawn if more than 3
	        var dd = instance_create_depth(_x, _y, depth-100, oMonsterEnemy);
			dd.card_number = first_available;
			dd.spawn_number = spawn_number; 
	        opponent_card_set[first_available].state = card_state.on_field;
		} else {
	        show_debug_message("No cards available in deck"); 
	        return;
	    }
	}
	else {
	     show_debug_message("Board full. Cannot spawn"); 
	}
		
	
    #endregion
}



/// this will become a lot more complex later
//// @desc spawn cards for enemy
/// @param {real} amount 
function spawn_cards_enemy_start(argument0){

	var amount = argument0;
	 for (var i = 0; i < amount; i++) {
        spawn_opponent_monster();
    }
}

