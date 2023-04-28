//all card actions for the player

//// @desc draws a card from the deck and adds it to your hand
#region basic stuff
	
	function draw_card_player() {
	
		//limit card draws to 7
		var card_count = instance_number(oCardPlayer);
		var cards_max = 5; 
		
		with(GameManager) if card_count < cards_max {		
			var available_cards = array_length(player_card_set); //available = not in_hand, destroyed, or on_field. This number will selec the "correct" card for the hand. 
			var cardnumber = 0; //which card number 
			var cards_in_hand = 0; //this is used to check if you are allowed to draw
			for (var h = 0; h < array_length(player_card_set); h++) {
				if (player_card_set[h].state = card_state.in_hand)
				or (player_card_set[h].state = card_state.on_field)
				or (player_card_set[h].state = card_state.destroyed)
				{
					cardnumber +=1; 
					available_cards -=1; 
					if available_cards = 1 oDeckPlayer.image_alpha = 0; //hide deck image if no more cards in deck to pick
				}
				if player_card_set[h].state = card_state.in_hand
					cards_in_hand +=1; 
			}
			
			#region create the card 
				var h = cards_in_hand;
				var s = cardnumber; //the card ID to pick
				if cards_in_hand < 5 && available_cards > 0 { //check cards in hand + if any cards left to draw
					array_resize(hand_set,cards_in_hand); 
					player_card_set[s].state = card_state.in_hand; 
				
					//determine draw position
					var new_pos = 0; 
					if instance_exists(oCardPlayer) {
						for (var h = 0; h <= cards_in_hand; h++) {
							with(oCardPlayer) if card_pos = h && card_pos <= new_pos //check if card has same number and no space between
								new_pos++;  	
						}	
					} else new_pos = 0; 
					dd = instance_create_depth(40+(sprite_get_width(card)+margin_cards)*new_pos,room_height-50,depth-100,oCardPlayer);
					dd.card_number = s; //gives card an ID
					dd.card_pos = new_pos; 
				}
			#endregion
			else	
			#region create message why you can't draw a card
				 {
					if available_cards = 0 {
						show_debug_message("deck is empty"); 
							dd = instance_create_depth(100,100,0,oUI_CardToast); 
							dd.str = "deck is empty";
					}	
					
				}
			#endregion
		}
	}

	
	function destroy_card_on_field_random() {
		var selected = irandom(2); //change later to check on field first
		player_card_set[selected].state = card_state.destroyed; 
	
		with (oMonsterPlayer) {
			 if card_number = selected 
				instance_destroy(); 
		}
		GameManager.card_slots[selected,0] = 0; //empty field spot
	}

	function init_card_slots() {		//check card slot in Game object before spawning on it. 
		 //set 'in slot' check (0) + x positions (1)
		card_slots = array_create(3,0);
		//for (var h = 0; h < array_length(card_slots); h++) {
		//	card_slots[h,1] = 22 + h*34; 
		//}
	}
#endregion 

#region actions

function attack_opponent() {
		
	//toggle play turn
	//if turn_to_play = 0 //moved this out of script for more flexibility 
	{
		//check if any monsters on field
		var count_on_field = 0; 
		for (var h = 0; h < array_length(player_card_set); h++) {
			if player_card_set[h].state = card_state.on_field {
				count_on_field +=1; 
			}
		}
			if count_on_field > 0 { //also check if it's still the player's turn
				show_debug_message("going to attackt..."); 
				//set attack turn for all oMonsterPlayer
				with (oMonsterPlayer) {
					x = xstart;
					attack_turn = true; 
				}
				
			} else {	
			//if no monsters on field, do nothing. 
			if !instance_exists(oUI_CardToast) {
				instance_create_depth(100,100,0,oUI_CardToast); 
			show_debug_message("cannot attack"); 
			}
		}
	}
}
	
	
	
	
function attack_target() { //attacks first target
	///@desc attacks a target on the opposite side
		
	//target the weakest enemy
	if instance_exists(oMonsterEnemy) {
		//attack monsters	
		var target = find_lowest_defense_enemy(); //oMonsterEnemy
		var card_opponent = oMonsterEnemy.card_number;
		var card_plr = card_number; 
			
		GameManager.opponent_card_set[card_opponent].defense -= GameManager.player_card_set[card_plr].attack; 
		
		dd = instance_create_depth(target.x-10+random_range(-20,20),target.y+random_range(0,-5),0,oUI_CardToast)
		var damage_counter = GameManager.player_card_set[card_plr].attack; 
		dd.str = ("-" + string(damage_counter)); 
		dd.toast_type = variant.damage; dd._y += 7; dd._x -=7; 
		
		if GameManager.opponent_card_set[card_opponent].defense <= 0 
		with(target) {
			if card_opponent = card_number instance_destroy(); 
		}
		//if less than zero, do difference damage to opponent directly
	}
	else {
		//attack opponent directly	
		var card_plr = card_number; 
		GameManager.opponent_HP -= GameManager.player_card_set[card_plr].attack; 
		if GameManager.opponent_HP <= 0 { //defeat oponnent 
			{
				GameManager.winner = 1;
				show_debug_message("you won!")
			}	
		}
	}
}

function attack_target_weakest() {
    ///@desc attacks a target on the opposite side
        
    //target the weakest enemy
    if instance_exists(oMonsterEnemy) {
        //attack monsters
        var target = noone;
        var lowest_defense = real;
        var card_opponent = -1;
        var card_plr = card_number;
        var candidates = [];

        // Find the monsters on the field
        for (var i = 0; i < 3; i++) {
            if (instance_exists(GameManager.opponent_card_set[i]) && GameManager.opponent_card_set[i].state == GameManager.card_state.on_field) {
                var len = array_length(candidates);
                array_push(candidates, i);
            }
        }

        // Find the monster with the lowest defense
        for (var i = 0; i < array_length(candidates); i++) {
            var card_index = candidates[i];
            var defense = GameManager.opponent_card_set[card_index].defense;
            if (defense < lowest_defense) {
                lowest_defense = defense;
                card_opponent = card_index;
                target = GameManager.opponent_card_set[card_index];
				show_debug_message("attacking weakest...")
            } else if (defense == lowest_defense) {
                // If multiple monsters have the same defense, choose one at random
                if (random(1) < 0.5) {
                    card_opponent = card_index;
                    target = GameManager.opponent_card_set[card_index];
					show_debug_message("attacking random",target); 
                }
            }
        }

        // Attack the weakest monster
        if (card_opponent != -1) {
            GameManager.opponent_card_set[card_opponent].defense -= GameManager.player_card_set[card_plr].attack;
            if (GameManager.opponent_card_set[card_opponent].defense <= 0) {
                with (oMonsterEnemy) {
                    if (card_number == card_opponent) {
                        instance_destroy();
                    }
                }
            }
        }
    }
}

















#endregion

///@description increases mana by X amount (ie at the end of a turn) 
/// @param {real} points
function increase_mana(argument0) {
	var points = argument0; 
	if points =-1 points = 1; 
	
	if GameManager.coins_player < 10
		GameManager.coins_player+=points; 
}
