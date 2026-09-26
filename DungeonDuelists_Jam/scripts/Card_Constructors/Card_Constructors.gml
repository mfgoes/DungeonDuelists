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
		ability = "" //short ability name shown on the card
		revived = false //used by Rebirth
		sprite = -1 //monster sprite on the board. -1 = use the object's default sprite
		tint = c_white //colour blend on the board
		model = "goblin" //3D model, see voxel_model_grids(). can also be a sprite
	}

	//monster types (inherit parent monster card) 

	function Monster_weak()  : Monster_card() constructor { //Weakest monster
		card_type = "monster"
		name =  "Tofu Troll"
		model = "troll"
		attack = 1
		defense = 2
		hp_max = defense 
		cost = 0
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
		cost = 1
	}

	function Monster_3_2()  : Monster_card() constructor {
		card_type = "monster"
		name =  "Oathbreaker"
		attack = 3
		defense = 3
		hp_max = defense 
		cost = 2
	}

	function Monster_3_3()  : Monster_card() constructor {
		card_type = "monster"
		name =  "Shade"
		attack = 3
		defense = 4
		hp_max = defense 
		cost = 2
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
		tint = make_colour_rgb(255, 140, 140)
		attack = 5
		defense = 7
		hp_max = defense 
		cost = 2
	}

	/// Special Monsters

	function Monster_Spiky() : Monster_card() constructor {
		card_type = "spiky"
		name =  "Thorned Mumak" //Mûmak
		model = "mumak"
		ability = "Thorns" //attackers take 1 damage
		tint = make_colour_rgb(170, 230, 150)
		attack = 2
		defense = 8
		hp_max = defense 
		cost = 3
	}
	
	function Monster_unique() : Monster_card() constructor {
    card_type = "unique"
    name =  "Blazing Phoenix"
	model = "phoenix"
	ability = "Rebirth" //comes back once with 2 hp
	tint = make_colour_rgb(255, 190, 120)
    attack = 4
    defense = 6
    hp_max = defense 
	cost = 4
    //special_ability = "When this card is defeated, it has a 50% chance to revive with 2 defense points."
	}

	function Monster_Imp() : Monster_card() constructor { //cheap thorns
		card_type = "spiky"
		name =  "Bramble Imp"
		model = "mumak"
		tint = make_colour_rgb(170, 230, 150)
		ability = "Thorns"
		attack = 1
		defense = 3
		hp_max = defense
		cost = 1
	}

	function Monster_Chick() : Monster_card() constructor { //cheap rebirth
		card_type = "unique"
		name =  "Ember Chick"
		model = "phoenix"
		tint = make_colour_rgb(255, 190, 120)
		ability = "Rebirth"
		attack = 2
		defense = 2
		hp_max = defense
		cost = 2
	}

#endregion

