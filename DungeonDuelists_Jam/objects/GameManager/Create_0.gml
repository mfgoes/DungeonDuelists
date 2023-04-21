/// @description generate deck
///global variables

// Essential Variables
#region essential variables
    global.TEXT_RES = 2; //text resolution (may change in settings later)
    global.debugmode = false;
    #macro TILESIZE 16
	// Card Visual Variables
	#region card visual variables
	    margin_cards = TILESIZE/2; //make this dynamic later
	    RES = global.TEXT_RES;
		m = 50;
	#endregion

    enum card_state
    {
        in_hand,
        in_deck, 
        on_field,
        destroyed 
    }
#endregion

// Game State Variables
#region game state variables
    turn_to_play = 0; //player. 1 = AI. 
    attack_turn = 0; //0 = player, 1 = AI.
    game_level  = 1; //there are 3 levels now, each with its own deck
    winner = 0; //1 = player 2 = enemy
    first_move = true; //don't draw a card on the first move
    battle_started = false;
#endregion

// Player and Opponent Stats
#region player and opponent stats
    player_HP = 3;
    HP_max = player_HP;
    opponent_HP = player_HP;
    HP_max_opponent = opponent_HP;
    coins_player = 7;
    coins_opponent = 5;
    draw_card = false; //for both player and opponent
	update_game_level();  //checks which level you are in (can be improved in the future)
#endregion


if (live_call()) return live_result;
#region player setup
	Deck_Init();
	
#endregion

//determine the opponent (move this later if required)
#region opponent setup
	deck_init_opponent(10); //create space for 10 cards by creating default values (weak monster)
	
	switch (game_level) {
    case 1:
        deck_construct_lvl1();
        break;
    case 2:
        deck_construct_lvl2();
		deck_constructor_player_medium(); 
		deck_shuffle(player_card_set); 
		 coins_player = 10; 
        break;
    case 3:
        deck_construct_lvl3();
		coins_player = 10; 
		
        break;
    default:
        show_error("Invalid game level", true);
        break;
}
	deck_shuffle(opponent_card_set); //shuffle
	
	
	//hand_init_opponent(3); //for the MVP, there is no opponent hand. They play directly from the deck. 
	init_card_slots_opponent();
	spawn_cards_enemy_start(2); //put 2 cards on the field at start of game (slightly different function)
#endregion 

