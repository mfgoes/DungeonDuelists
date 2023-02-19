// Script assets have changed for v2.3.0 see
// this should be run at the start of the game
function generate_player_deck() {
	card_db = ds_map_create();
	generate_cards_monsters();
	//generate_cards_upgrades(); //later
}

function generate_cards_monsters() {
	// Add the monster cards to the database
	strong_monster_card = ds_map_create();
	ds_map_add(strong_monster_card, "type", "monster");
	ds_map_add(strong_monster_card, "name", "Strong Monster");
	ds_map_add(strong_monster_card, "attack", 2);
	ds_map_add(strong_monster_card, "defense", 1);
	ds_map_add(card_db, "strong_monster", strong_monster_card);
	
	average_monster_card = ds_map_create();
	ds_map_add(average_monster_card, "type", "monster");
	ds_map_add(average_monster_card, "name", "Average Monster");
	ds_map_add(average_monster_card, "attack", 1);
	ds_map_add(average_monster_card, "defense", 1);
	ds_map_add(card_db, "average_monster", average_monster_card);

	weak_monster_card = ds_map_create();
	ds_map_add(weak_monster_card, "type", "monster");
	ds_map_add(weak_monster_card, "name", "Weak Monster");
	ds_map_add(weak_monster_card, "attack", 0);
	ds_map_add(weak_monster_card, "defense", 1);
	ds_map_add(card_db, "weak_monster", weak_monster_card);
}


function generate_cards_upgrades() {
	// Add the upgrade cards to the database
	attack_upgrade_card = ds_map_create();
	ds_map_add(attack_upgrade_card, "type", "upgrade");
	ds_map_add(attack_upgrade_card, "name", "Attack Upgrade");
	ds_map_add(card_db, "attack_upgrade", attack_upgrade_card);

	defense_upgrade_card = ds_map_create();
	ds_map_add(defense_upgrade_card, "type", "upgrade");
	ds_map_add(defense_upgrade_card, "name", "Defense Upgrade");
	ds_map_add(card_db, "defense_upgrade", defense_upgrade_card);

	heal_card = ds_map_create();
	ds_map_add(heal_card, "type", "upgrade");
	ds_map_add(heal_card, "name", "Heal");
	ds_map_add(card_db, "heal", heal_card);

}