/// @description generate deck
///global variables

// Essential Variables
#region essential variables
    global.RES_GUI = 2; //text resolution (may change in settings later)
	global.RES_TEXT = 0.4; //downscaled for font resolution purposes. 0.5 = normal size. 1 = twice as much.
    global.debugmode = false;
	font_setup(); //adds a font externally
    #macro TILESIZE 16
	// Card Visual Variables
	#region card visual variables
	    margin_cards = TILESIZE/2; //make this dynamic later
	    RES =global.RES_GUI;
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
	if (!variable_global_exists("level")) global.level = 0; //index into level_data(). survives room_restart
	var _levels = level_data();
	level_info = _levels[global.level];
    winner = 0; //1 = player 2 = enemy
    first_move = true; //don't draw a card on the first move
    battle_started = false;
	depth = -100;
#endregion

// Player and Opponent Stats
#region player and opponent stats
    player_HP = 3;
    HP_max = player_HP;
    opponent_HP = player_HP;
    HP_max_opponent = opponent_HP;
    coins_player = level_info.coins;
    coins_opponent = 5;
    draw_card = false; //for both player and opponent
#endregion


if (live_call()) return live_result;
#region player setup
	layer_background_blend(layer_background_get_id(layer_get_id("Background")), level_info.tint);
	Deck_Init();
	
#endregion

//determine the opponent (move this later if required)
#region opponent setup
	opponent_card_set = deck_from_list(level_info.enemy_deck);
	deck_shuffle(opponent_card_set); //shuffle
	
	
	//hand_init_opponent(3); //for the MVP, there is no opponent hand. They play directly from the deck. 
	init_card_slots_opponent();
	spawn_cards_enemy_start(2); //put 2 cards on the field at start of game (slightly different function)
#endregion 

