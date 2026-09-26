/// @desc all levels in play order. to add a level, add a new struct to the list.
/// name: shown at the top of the screen
/// tint: background colour blend
/// bg_sprite: (optional) background sprite for this level, e.g. bg_sprite: spr_bg_forest
/// coins: starting mana for the player
/// ai: enemy tactic. "weakest" (hits lowest hp), "strongest" (hits highest attack) or "random"
/// player_deck / enemy_deck: lists of card constructors (see Card_Constructors)
function level_data() {
	var _basic = [Monster_2_2, Monster_1_3, Monster_3_5, Monster_3_2, Monster_1_3, Monster_3_3, Monster_3_2, Monster_3_3, Monster_Spiky, Monster_unique];
	var _advanced = [Monster_Imp, Monster_Imp, Monster_Chick, Monster_Chick, Monster_3_3, Monster_3_5, Monster_3_2, Monster_Spiky, Monster_5_5, Monster_unique];
	var _medium = [Monster_1_3, Monster_2_2, Monster_2_2, Monster_2_2, Monster_1_3, Monster_1_3, Monster_3_2, Monster_3_2, Monster_3_3, Monster_unique];

	return [
		{ //forest, weakest monsters to learn the game
			name: "Fledgling Foes",
			ai: "random",
			tint: c_white,
			coins: 7,
			player_deck: _basic,
			enemy_deck: [Monster_weak, Monster_weak, Monster_weak, Monster_weak, Monster_2_2, Monster_2_2, Monster_2_2, Monster_1_3, Monster_1_3, Monster_2_2],
		},
		{ //graveyard
			name: "Shadowbound Showdown",
			ai: "weakest",
			tint: make_colour_rgb(150, 160, 210),
			coins: 10,
			player_deck: _medium,
			enemy_deck: [Monster_2_2, Monster_weak, Monster_weak, Monster_1_3, Monster_1_3, Monster_3_2, Monster_3_2, Monster_3_5, Monster_Spiky, Monster_3_2],
		},
		{ //volcano
			name: "Mythic Menace",
			ai: "strongest",
			tint: make_colour_rgb(255, 170, 140),
			coins: 10,
			player_deck: _basic,
			enemy_deck: [Monster_weak, Monster_weak, Monster_3_5, Monster_3_5, Monster_5_5, Monster_Spiky, Monster_Spiky, Monster_3_3, Monster_3_3, Monster_3_2],
		},
		{ //high defense wall: few big hits needed
			name: "Thornwall Pass",
			ai: "weakest",
			tint: make_colour_rgb(170, 220, 160),
			coins: 10,
			player_deck: _medium,
			enemy_deck: [Monster_1_3, Monster_1_3, Monster_1_3, Monster_Spiky, Monster_Spiky, Monster_Spiky, Monster_3_5, Monster_3_5],
		},
		{ //small but very strong deck
			name: "Drake's Roost",
			ai: "strongest",
			tint: make_colour_rgb(255, 205, 120),
			coins: 10,
			player_deck: _basic,
			enemy_deck: [Monster_3_3, Monster_3_3, Monster_5_5, Monster_5_5, Monster_3_5, Monster_3_5, Monster_5_5, Monster_Spiky],
		},
		{ //long fight
			name: "Phoenix Throne",
			ai: "weakest",
			tint: make_colour_rgb(205, 165, 235),
			coins: 10,
			player_deck: _basic,
			enemy_deck: [Monster_3_2, Monster_3_2, Monster_3_3, Monster_3_3, Monster_3_5, Monster_3_5, Monster_Spiky, Monster_Spiky, Monster_5_5, Monster_5_5, Monster_unique, Monster_unique],
		},
		{ //thorns everywhere: attacking hurts
			name: "Bramble Hollow",
			ai: "random",
			tint: make_colour_rgb(140, 190, 130),
			coins: 10,
			player_deck: _advanced,
			enemy_deck: [Monster_Imp, Monster_Imp, Monster_Imp, Monster_Imp, Monster_Spiky, Monster_Spiky, Monster_2_2, Monster_2_2, Monster_3_2, Monster_3_2],
		},
		{ //enemies keep coming back
			name: "Ashen Nest",
			ai: "strongest",
			tint: make_colour_rgb(255, 150, 110),
			coins: 10,
			player_deck: _advanced,
			enemy_deck: [Monster_Chick, Monster_Chick, Monster_Chick, Monster_Chick, Monster_unique, Monster_unique, Monster_3_3, Monster_3_3, Monster_3_2, Monster_3_2],
		},
		{ //big deck of mid monsters: long grind
			name: "Revenant Crypt",
			ai: "weakest",
			tint: make_colour_rgb(130, 130, 180),
			coins: 10,
			player_deck: _advanced,
			enemy_deck: [Monster_3_2, Monster_3_2, Monster_3_2, Monster_3_3, Monster_3_3, Monster_3_3, Monster_1_3, Monster_1_3, Monster_3_5, Monster_3_5, Monster_Imp, Monster_Chick],
		},
		{ //final level
			name: "Dragon King",
			ai: "strongest",
			tint: make_colour_rgb(230, 120, 120),
			coins: 10,
			player_deck: _advanced,
			enemy_deck: [Monster_5_5, Monster_5_5, Monster_5_5, Monster_unique, Monster_unique, Monster_Spiky, Monster_Spiky, Monster_3_5, Monster_3_5, Monster_3_3, Monster_3_3, Monster_Chick],
		},
	];
}

function level_count() {
	return array_length(level_data());
}

/// @desc builds an array of new cards from a list of card constructors
/// @param {array} list
function deck_from_list(_list) {
	var _deck = array_create(array_length(_list));
	for (var i = 0; i < array_length(_list); i++) {
		var _card = _list[i];
		_deck[i] = new _card();
	}
	return _deck;
}
