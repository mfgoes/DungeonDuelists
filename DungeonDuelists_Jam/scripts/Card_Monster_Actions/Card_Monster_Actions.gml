#region monster related stuff

	function generate_player_monster() {
		with(GameManager) {
		var target = id; if instance_exists(oStagePlayer) target = oStagePlayer; 
		var spawn_number = 0; //used to determine which attacks first

		//to do: needs refinement

		//spawn an enemy in an empty spot on the board
		var spawn_number = -1;
		for (var i = 0; i < array_length(card_slots); i++) {
	        if (card_slots[i] == 0) {
	            spawn_number = i;
	            card_slots[i] = 1;
	            break;
	        }
	    }
		if (spawn_number == -1) { //no free slot, don't spawn
			show_debug_message("Board full. Cannot spawn");
			player_card_set[other.card_number].state = card_state.destroyed;
			return;
		}

		var _x = target.x + 20 + 34 * spawn_number;
		var _y = target.y - 10; 
	
		dd = instance_create_depth(_x,_y,depth-10,oMonsterPlayer); 
		dd.card_number = other.card_number; 
		dd.spawn_number = spawn_number; 
	}
	}
#endregion

