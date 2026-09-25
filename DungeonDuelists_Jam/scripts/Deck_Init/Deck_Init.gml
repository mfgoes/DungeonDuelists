// Script assets have changed for v2.3.0 see
/// @function Deck_Init()
/// @description Generates the player deck
function Deck_Init(){

player_card_set = deck_from_list(GameManager.level_info.player_deck); //build the level deck before drawing the hand
deck_shuffle(player_card_set); 
Start_from_deck(3); //picks 3 first cards and makes them "in hand" 
init_card_slots(); 

}

