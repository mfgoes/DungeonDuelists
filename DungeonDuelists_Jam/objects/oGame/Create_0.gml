/// @description generate deck
/// @desc repick hand
if (live_call()) return live_result;

// Print the contents of the card database


//Generate deck using structs and arrays



monster_cards = {
	monster_strong: {
		card_type: "monster",
		name: "Strong monster",
		attack: 2,
		defense: 2,
		state: card_state.in_deck
	},
	monster_mid: {
		card_type: "monster",
		name: "Mid monster",
		attack: 1,
		defense: 1,
		state: card_state.in_deck
	},
	monster_weak: {
		card_type: "monster",
		name: "Weak monster",
		attack: 0,
		defense: 1,
		state: card_state.in_deck
	},
	empty_slot: {
		card_type: "empty",
	}
}


//create a database using the above cards
your_deck = array_create(20, 0);
your_deck = [
	monster_cards.monster_weak, //use constructor to recieve variables easily. 
	monster_cards.monster_weak, 
	monster_cards.monster_weak, 
	monster_cards.monster_weak, 
	monster_cards.monster_weak, 
	monster_cards.monster_mid,
	monster_cards.monster_mid,
	monster_cards.monster_mid,
	monster_cards.monster_strong,
	monster_cards.monster_strong
]

//create a hand using the above cards
your_hand = array_create(10, your_deck[0]);

//draw 3 cards from the deck //pick_a_card() -

your_hand = 
[
	your_deck[0],
	your_deck[7], //1
	your_deck[9]  //2
]



//MODIFY A CARD IN YOUR HAND
//your_deck[0].name = "hello"; 
your_hand[1].state = card_state.destroyed; 

