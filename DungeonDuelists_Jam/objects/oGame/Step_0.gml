/// @desc repick hand
if (live_call()) return live_result;

#region basic controls
	if (keyboard_check_pressed(vk_f1) || keyboard_check_pressed(ord("0")))
	{
	if window_get_fullscreen()
	    {
	    window_set_fullscreen(false);
	    }
	else
	    {
	    window_set_fullscreen(true);
	    }
	}
	
	if (keyboard_check_pressed(vk_escape)) {
		room_restart(); 	
	}
	
#endregion

//loop through the deck, then change the states if it's in the hand. (color change can happen later)
#region
	for (var h = 0; h < array_length(your_deck); h++) { //compare all the deck cards to your first hand (automate later)
		if array_get(your_deck,h) = array_get(your_hand,0) 
		x = 0; 
	}	
#endregion
/*&& your_hand[0].state = card_state.in_hand && your_deck[h].state = card_state.in_deck {
			//your_deck[h].state = card_state.in_hand; 
		} 
		*/

//repick hand
if keyboard_check_pressed(ord("R")) {
	your_hand[0] = your_deck[irandom(array_length(your_deck)-1)]; //reshuffles first hand	
}