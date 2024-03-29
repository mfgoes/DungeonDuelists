
/// @desc opponent deck
/// @param {integer} amount of cards
function deck_init_opponent(argument0) {
	amount = argument0;
	opponent_card_set = array_create_ext(amount, function() { return new Monster_weak();});
	for (var h = 0; h < 3; h++) {
		with (opponent_card_set[h]) {
			Monster_weak();
		}
	}
}


function attack_player_init(){
	
	//1: attack if possible
	if instance_exists(oMonsterEnemy) with(oMonsterEnemy){
		x = xstart; 
		attack_turn = true; //let the monsters attack
	}
}


function attack_player() {
		
var count_on_field = 0; 
for (var h = 0; h < array_length(player_card_set); h++) {
	if player_card_set[h].state = card_state.on_field {
		count_on_field +=1; 
	}
}

show_debug_message("attacking player monsters..."); 
with (oMonsterEnemy) {
	x = xstart;
	attack_turn = true; 
}
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
