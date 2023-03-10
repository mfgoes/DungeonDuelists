//all card actions for the player

#region basic stuff

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
		for (var h = 0; h < array_length(hand_set); h++) {
			hand_set[h] = card_set[h];
			card_set[h].state = card_state.in_hand; 
		}
	}

	function draw_hand_objects(argument0) {
		var num = argument0;
		for (var h = 0; h < num; h++) {
			dd = instance_create_depth(100+(sprite_get_width(card)+TILESIZE)*h,room_height-60,depth-100,oCardPlayer);
			dd.card_number = h; //gives card an ID
		}
	}

	function destroy_card_on_field_random() {
		var selected = irandom(2); //change later to check on field first
		card_set[selected].state = card_state.destroyed; 
	
		with (oMonsterPlayer) {
			 if card_number = selected 
				instance_destroy(); 
		}
		oConstructorTest.card_slots[selected,0] = 0; //empty field spot
	}

	function init_card_slots() {		//check card slot in Game object before spawning on it. 
		 //set 'in slot' check (0) + x positions (1)
		card_slots = array_create(3,0);
		for (var h = 0; h < array_length(card_slots); h++) {
			card_slots[h,1] = 22 + h*34; 
		}
	}
#endregion 

#region actions

	function attack_opponent() {
		//check if any monsters on field
		var count_on_field = 0; 
		for (var h = 0; h < array_length(card_set); h++) {
			if card_set[h].state = card_state.on_field {
				count_on_field +=1; 
			}
		}
			if count_on_field > 0 { //also check if it's still the player's turn
				show_debug_message("attacking opponent..."); 
				//set attack turn for all oMonsterPlayer
				with (oMonsterPlayer) {
					x = xstart;
					attack_turn = true; 
				}
				
			} else {	
			//if no monsters on field, do nothing. 
			if !instance_exists(oUI_CardToast)
				instance_create_depth(0,0,0,oUI_CardToast); 
			show_debug_message("cannot attack"); 
			}
	}
	
	function attack_target() {
		///@desc attacks a target on the opposite side
		
		//set arg to target. create seperate function list for 'used by both opponent and player' 
		if instance_exists(oMonsterEnemy) {
			//attack monsters	
			var target = oMonsterEnemy;
			var card_opponent = oMonsterEnemy.card_number;
			var card_plr = card_number; 
			
			oConstructorTest.opponent_card_set[card_opponent].defense -= oConstructorTest.card_set[card_plr].attack; 
			if oConstructorTest.opponent_card_set[card_opponent].defense <= 0 
			with(target) {
				if card_opponent = card_number instance_destroy(); 
			}
			//if less than zero, do difference damage to opponent directly
		}
		else {
			//attack opponent directly	
		}
	}
	
#endregion