/// @description generate deck
generate_player_deck(); 

// Print the contents of the card database
show_debug_message("Card Database:");
card_list = ds_map_find_first(card_db);
while (card_list != -1) {
    card_name = ds_map_find_first(card_list);
    show_debug_message(card_name + ":");
    card_attributes = ds_map_find_value(card_list,"monster");
    card_attribute = ds_map_find_first(card_attributes);
    while (card_attribute != -1) {
        show_debug_message("    " + card_attribute + ": " + ds_map_find_value(card_attributes, card_attribute));
        card_attribute = ds_map_find_next(card_attributes, card_attribute);
    }
    card_list = ds_map_find_next(card_db, card_list);
}