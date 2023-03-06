/// @description generate deck

///global variables
#region essential variables
	global.TEXT_RES = 2; //text resolution (may change in settings later)
	global.debugmode = true; 
	#macro TILESIZE 16
	enum card_state
	{
		in_hand,
		in_deck, 
		on_field,
		destroyed	
	}
	//Setup game states
	turn_to_play = 0; //player. 1 = AI. 
	player_HP = 3; HP_max = 3; 
	opponent_HP = 3; HP_max_opponent = 3; 
	RES = global.TEXT_RES; 

#endregion

if (live_call()) return live_result;
#region player setup
	Deck_Init();
	
#endregion

//GENERATE ENEMY CARDS
#region opponent setup
	deck_init_opponent(5); 
	deck_shuffle(opponent_card_set); 
	hand_init_opponent(3); //picks 3 cards from the opponent deck
	init_card_slots_opponent();
	spawn_cards_enemy(2); //draw_hand_objects (rename this)
#endregion 



//player turn 
//draw player card if possible
//play player cards if possible
//'attack (end turn)

//enemy turn
//draw card if possible 
//spawn cards if possible
//'attack' (end turn) 

//if extra damage left, damage player/opponent. 
//if 0 HP left: win / lose scenario