/// @description generate deck

///global variables
#region essential variables
	global.TEXT_RES = 2; //text resolution (may change in settings later)
	global.debugmode = false; 
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
	winner = 0; //1 = player 2 = enemy
	player_HP = 5; HP_max = 5; 
	opponent_HP = 5; HP_max_opponent = 5; 
	RES = global.TEXT_RES; 
	coins_player = 5;
	coins_opponent = 5; 
	draw_card = false; //for both player and opponent
	first_move = true; //don't draw a card on the first move
	
	//UI animaiton
	 m = 50; 
	 
	 //card visual variables
	 margin_cards = TILESIZE/2; //make this dynamic later

#endregion

if (live_call()) return live_result;
#region player setup
	Deck_Init();
	
#endregion

//GENERATE ENEMY CARDS
#region opponent setup
	deck_init_opponent(3); 
	//deck_shuffle(opponent_card_set); 
	hand_init_opponent(3); //put 3 cards in player hand
	init_card_slots_opponent();
	spawn_cards_enemy_start(3); //put 2 cards on the field at start of game (slightly different function)
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