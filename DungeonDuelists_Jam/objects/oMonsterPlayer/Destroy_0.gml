/// @description Insert description here
with (GameManager) {
	player_card_set[other.card_number].state = card_state.destroyed;
	card_slots[other.spawn_number] = 0; //reset spawn location1
}
dd = instance_create_depth(x,y,depth,oMonsterDeadAnim);
dd.sprite_index = sprite_index;
dd.image_index = image_index; 