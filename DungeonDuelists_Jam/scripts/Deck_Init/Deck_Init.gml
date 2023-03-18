// Script assets have changed for v2.3.0 see
/// @function Deck_Init()
/// @description Generates the player deck
function Deck_Init(){

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

	deck_shuffle(card_set); 
#endregion


//GENERATE HAND FROM DECK STRUCTS
Start_from_deck(3); //picks 3 first cards and makes them "in hand" 
//draw_hand_objects(3); //to do: refine this
//GENERATE CARD SLOTS ON BOARD 
init_card_slots(); 

}