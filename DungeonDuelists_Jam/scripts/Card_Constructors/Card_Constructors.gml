//create the parent monster card

#region available cards
	function Monster_card() constructor {
		card_type = "monster"
		name =  "Default name"
		attack = 0
		defense = 1
		cost = 1 //spawn cost
		hp_max = defense 
		state = card_state.in_deck
		identifier = 0; 
	}

	//monster types (inherit parent monster card) 

	function Monster_weak()  : Monster_card() constructor { //Weakest monster
		card_type = "monster"
		name =  "Tofu Troll"
		attack = 1
		defense = 2
		hp_max = defense 
	}

	function Monster_2_2()  : Monster_card() constructor {
		card_type = "monster"
		name =  "Twiggy Forager"
		attack = 2
		defense = 3
		hp_max = defense 
	}

	function Monster_1_3()  : Monster_card() constructor {
		card_type = "monster"
		name =  "Mirkwood Weaver"
		attack = 1
		defense = 4
		hp_max = defense
		cost = 2
	}

	function Monster_3_2()  : Monster_card() constructor {
		card_type = "monster"
		name =  "Oathbreaker"
		attack = 3
		defense = 3
		hp_max = defense 
		cost = 3
	}

	function Monster_3_3()  : Monster_card() constructor {
		card_type = "monster"
		name =  "Shade"
		attack = 3
		defense = 4
		hp_max = defense 
		cost = 3
	}

	function Monster_3_5()  : Monster_card() constructor {
		card_type = "monster"
		name =  "Howling Moonbeast"
		attack = 3
		defense = 6
		hp_max = defense 
		cost = 3
	}

	function Monster_5_5() : Monster_card() constructor {
		card_type = "monster"
		name =  "Fire Drake"
		attack = 5
		defense = 7
		hp_max = defense 
		cost = 3
	}

	/// Special Monsters

	function Monster_Spiky() : Monster_card() constructor {
		card_type = "spiky"
		name =  "Thorned Mumak" //Mûmak
		attack = 2
		defense = 8
		hp_max = defense 
		cost = 4
	}
	
	function Monster_unique() : Monster_card() constructor {
    card_type = "unique"
    name =  "Blazing Phoenix"
    attack = 4
    defense = 6
    hp_max = defense 
	cost = 5
    //special_ability = "When this card is defeated, it has a 50% chance to revive with 2 defense points."
	}

#endregion

