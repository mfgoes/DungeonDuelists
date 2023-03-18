
function opponent_start_turn(){
	if instance_exists(oMonsterEnemy) with(oMonsterEnemy){
		x = xstart; 
		attack_turn = true; //let the monsters attack
	}
}


function attack_player() {
		
var count_on_field = 0; 
for (var h = 0; h < array_length(card_set); h++) {
	if card_set[h].state = card_state.on_field {
		count_on_field +=1; 
	}
}

show_debug_message("attacking player monsters..."); 
with (oMonsterEnemy) {
	x = xstart;
	attack_turn = true; 
}
}

	
	
function attack_target_player() {
	///@desc attacks the opposite side
	
	//check how many cards you have left
	var destroyed = 0; 
	for (var h = 0; h < array_length(oConstructorTest.card_set); h++) {
		if oConstructorTest.card_set[h].state = card_state.destroyed {
			destroyed +=1; 
		}
	}
	var cards_total = array_length(oConstructorTest.card_set); 
	var cards_left = cards_total - destroyed;
	
	
		
	//set arg to target. create seperate function list for 'used by both opponent and player' 
	if instance_exists(oMonsterPlayer) {
		//attack monsters	
		var target = oMonsterPlayer;
		var card_opponent = oMonsterPlayer.card_number;
		var card_plr = card_number; 
		var targetHP = oConstructorTest.player_HP;  
			
		oConstructorTest.card_set[card_opponent].defense -= oConstructorTest.opponent_card_set[card_plr].attack; 
		if oConstructorTest.card_set[card_opponent].defense <= 0 
		with(target) {
			if card_opponent = card_number instance_destroy(); 
		}
		//if less than zero, do difference damage to opponent directly
	}
	else { //attack player directly
		show_debug_message("attacking player directly")
		oConstructorTest.player_HP -= 1;
		}
		if oConstructorTest.player_HP <= 0 {
			{
				//defeat player 
				oConstructorTest.winner = 2;
				show_debug_message("you lost... cards left: {0}/{1}",cards_left,cards_total)
			}	
	}
}
