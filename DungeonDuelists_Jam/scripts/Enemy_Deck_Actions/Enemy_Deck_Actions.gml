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
			Monster_strong();
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

/// this will become a lot more complex later
//// @desc spawn cards for enemy
/// @param {real} amount 
function spawn_cards_enemy_start(argument0){

	var amount = argument0;
	var _y = oStageEnemy.y - 10; 
	var spawn_slot = 0; 
	var card_number = 0; //deck ID
	//check if slot is free (in array), then spawn in free spot.
	//spawn an enemy in an empty spot on the board
	
	repeat(amount) {
		var _x = oStageEnemy.x + 20; 
		
		if card_slots_opponent[0] = 0 {
		card_slots_opponent[0] = 1;
		spawn_slot = card_slots_opponent[0]; 
		} else
		if card_slots_opponent[1] = 0 {
			card_slots_opponent[1] = 1;
			spawn_slot = card_slots_opponent[1]; 
			_x += 34; 
		} else
		if card_slots_opponent[2] = 0 {
			card_slots_opponent[2] = 1;
			spawn_slot = card_slots_opponent[2]; 
			_x += 34*2; 
		}
		else spawn_slot = 0; //show text: cannot spawn 
		dd = instance_create_depth(_x,_y,depth-20,oMonsterEnemy); //spawns the first two cards
		opponent_card_set[card_number].state = card_state.on_field; 
		dd.card_number = card_number; //card identifier, so that it knows which deck card to retrieve. 
		card_number+=1; 
	}
}

