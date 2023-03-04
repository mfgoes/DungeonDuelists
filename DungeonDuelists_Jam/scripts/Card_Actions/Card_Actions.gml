// Script assets have changed for v2.3.0 see
// @desc picks top 3 cards from deck
function deck_shuffle() {
	r = array_length(card_set) - 1;
	for(var i = 0; i < r; i += 1) {
	    j = irandom_range(i,r);
	    temp = card_set[i];
	    card_set[i] = card_set[j];
	    card_set[j] = temp;
	}
}

function Start_from_deck(argument0) {
	hand_set[argument0] = card_set[argument0];
	card_set[argument0].state = card_state.in_hand; 
}

function draw_hand_objects(argument0) {
	dd = instance_create_depth(100+(sprite_get_width(card)+TILESIZE)*argument0,room_height-60,depth-100,oCardPlayer);
	dd.card_number = argument0; //gives card an ID
}

function destroy_card_on_field_random() {
	var selected = irandom(2); //change later to check on field first
	card_set[selected].state = card_state.destroyed; 
	
	with (oMonsterPlayer) {
		 if card_number = selected 
			instance_destroy(); 
	}
	oConstructorTest.card_slots[selected,0] = 0; //empty field spot
}