// Script assets have changed for v2.3.0 see
/// @function Deck_Init()
/// @description Generates the player deck
function Deck_Init(){

player_card_set = array_create_ext(10, function() { return new Monster_weak();});

deck_constructor_player_basic(); 
deck_shuffle(player_card_set); 
Start_from_deck(3); //picks 3 first cards and makes them "in hand" 
init_card_slots(); 

}