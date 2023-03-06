// Script assets have changed for v2.3.0 see
/// @desc picks top 3 cards from deck
/// @param {real} deck The deck to shuffle
function deck_shuffle(argument0) {
	//var deck = argument0; 
	r = array_length(argument0) - 1;
	for(var i = 0; i < r; i += 1) {
	    j = irandom_range(i,r);
	    temp = argument0[i];
	    argument0[i] = argument0[j];
	    argument0[j] = temp;
	}
}

//// @desc cards to pick up at the start of a game
/// @param {real} cards 
function Start_from_deck(argument0) {
	var num = argument0;
	hand_set =  array_create(num,0);
	for (var h = 0; h < array_length(hand_set); h++) {
		hand_set[h] = card_set[h];
		card_set[h].state = card_state.in_hand; 
	}
}

function draw_hand_objects(argument0) {
	var num = argument0;
	for (var h = 0; h < num; h++) {
		dd = instance_create_depth(100+(sprite_get_width(card)+TILESIZE)*h,room_height-60,depth-100,oCardPlayer);
		dd.card_number = h; //gives card an ID
	}
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

function init_card_slots() {		//check card slot in Game object before spawning on it. 
	 //set 'in slot' check (0) + x positions (1)
	card_slots = array_create(3,0);
	for (var h = 0; h < array_length(card_slots); h++) {
		card_slots[h,1] = 22 + h*34; 
	}
}