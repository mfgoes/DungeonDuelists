// Script assets have changed for v2.3.0 see

//// @desc spawn new opponents from deck, if possible
/// @param {real} amount 
function spawn_opponent_monster() {
	var count = choose(2,3)
	//if random(1) < 0.2 count = 0; //spawn nothing sometimes
	
	repeat(count) {
	    var card_number = 0; //which card number to put on field
	    var cards_on_field = 0; //skip putting in hand first
	    var first_available = -1; //initialize to an invalid index

	    for (var h = 0; h < array_length(opponent_card_set); h++) {
			var card_current = opponent_card_set[h];
	        if (card_current.state == card_state.on_field) {
			
				card_number = h + 1 - cards_on_field;
				cards_on_field += 1;
	            //card_number += 1;
	            //available_cards -= 1;
	        } else if (card_current.state == card_state.in_deck && first_available == -1) {
	               first_available = h;
	            }
			}
	
		var spawn_number = -1;
		for (var i = 0; i < array_length(card_slots_opponent); i++) {
	        if (card_slots_opponent[i] == 0) {
	            spawn_number = i;
	            card_slots_opponent[i] = 1;
	            break;
	        }
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

function attack_target_player() {
    ///@desc attacks the opposite side

    // Check how many cards you have left
    var destroyed = 0;
    for (var h = 0; h < array_length(GameManager.player_card_set); h++) {
        if (GameManager.player_card_set[h].state == card_state.destroyed) {
            destroyed += 1;
        }
    }
    var cards_total = array_length(GameManager.player_card_set);
    var cards_left = cards_total - destroyed;

    // Set arg to target
	var target =noone;
		if (random(1) < 0.5) { // 50% chance to attack a random monster
	    var on_field_monsters = [];
    
	    for (var i = 0; i < array_length(GameManager.player_card_set); i++) {
	        var card_current = GameManager.player_card_set[i];
	        if (card_current.state == card_state.on_field) {
	            var player_monster_instance = noone;
	            with (oMonsterPlayer) {
	                if (card_number == i) {
	                    player_monster_instance = id;
	                    break;
	                }
	            }
	            if (player_monster_instance != noone) {
	                array_push(on_field_monsters, player_monster_instance);
	            }
	        }
	    }

	    if (array_length(on_field_monsters) > 0) {
	        target = on_field_monsters[irandom(array_length(on_field_monsters) - 1)];
			
	    }
		} else {
		    target = find_lowest_defense_player_monster();
		}

    if (target != noone) {
        // Attack monsters
        var card_opponent = target.card_number;
        var card_plr = card_number;

        GameManager.player_card_set[card_opponent].defense -= GameManager.opponent_card_set[card_plr].attack;
		
		dd = instance_create_depth(target.x+random_range(-10,10),target.y+random_range(0,5),0,oUI_CardToast)
		var damage_counter = GameManager.opponent_card_set[card_plr].attack; 
		dd.str = ("-" + string(damage_counter)); 
		dd.toast_type = variant.damage;
		dd._y += 7; dd._x -=7;
		
        if (GameManager.player_card_set[card_opponent].defense <= 0) {
            with (target) {
                if (card_opponent == card_number) {
                    instance_destroy();
                }
            }
        }
    } else {
        // Attack player directly
        show_debug_message("attacking player directly");
        GameManager.player_HP -= 1;
    }

    if (GameManager.player_HP == 0) {
        // Defeat player
        GameManager.winner = 2;
        show_debug_message(string_format("you lost... cards left: %d/%d", cards_left, cards_total));
    }
}


function calculate_remaining_enemies() {
	var opponents_left = array_length(opponent_card_set);
    
    for (var h = 0; h < array_length(opponent_card_set); h++) {
        if opponent_card_set[h].state == card_state.destroyed {
            opponents_left -= 1;
        }
    }
    
    return opponents_left;
}

function calculate_total_enemies() {
	var total_enemies = 0; 
	 for (var h = 0; h < array_length(opponent_card_set); h++) {
        if opponent_card_set[h].card_type == "monster" {
            total_enemies += 1; 
        }
    }
	return total_enemies; 
}

