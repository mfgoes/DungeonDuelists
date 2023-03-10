//create the parent monster card
function Monster_card() constructor {
	card_type = "monster"
	name =  "Default name"
	attack = 0
	defense = 1
	state = card_state.in_deck
	identifier = 0; 
}

//monster types (inherit parent monster card) 
function Monster_strong() : Monster_card() constructor {
	card_type = "monster"
	name =  "Strong Monster"
	attack = 2
	defense = 4
}

function Monster_weak()  : Monster_card() constructor {
	card_type = "monster"
	name =  "Weak Monster"
	attack = 1
	defense = 1
}

function Monster_mid()  : Monster_card() constructor {
	card_type = "monster"
	name =  "Mid Monster"
	attack = 2
	defense = 1
}


