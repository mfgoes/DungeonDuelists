/// @description generate deck

///global variables
global.TEXT_RES = 2; //text resolution (may change in settings later)
#macro TILESIZE 16
enum card_state
{
	in_hand,
	in_deck, 
	on_field,
	destroyed	
}

if (live_call()) return live_result;

#region generate deck
	card_set = array_create_ext(10, function() { return new Monster_weak();});

	//generate 4 strong cards
	for (var h = 0; h < 4; h++) {
		with (card_set[h]) {
			Monster_strong();
		}
	}

	//generate 2 mid cards
	for (var h = 4; h < 6; h++) {
		with (card_set[h]) {
			Monster_mid();
		}
	}

	deck_shuffle(); 
#endregion


//GENERATE HAND FROM DECK STRUCTS
hand_set = array_create(3,0);
for (var h = 0; h < array_length(hand_set); h++) {
	Start_from_deck(h); //picks 3 first cards and makes them "in hand" 
	draw_hand_objects(h); 
}

//GENERATE CARD SLOTS ON BOARD 
 //set 'in slot' variable + x positions
card_slots = array_create(3,0);
for (var h = 0; h < array_length(card_slots); h++) {
	card_slots[h,1] = 22 + h*34; 
}


//Setup game states
turn_to_play = 0; //player. 1 = AI. 


//GENERATE ENEMY CARDS
spawn_cards_enemy();

