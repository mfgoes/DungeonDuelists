/// @description Insert description here
with (GameManager) {
	player_card_set[other.card_number].state = card_state.destroyed;
	if (other.spawn_number >= 0) card_slots[other.spawn_number] = 0; //reset spawn location1
}
dd = instance_create_depth(x,y,depth,oMonsterDeadAnim);
dd.sprite_index = sprite_index;
dd.image_index = image_index;
dd.image_blend = image_blend;
dd.has_model = true;
dd.model = GameManager.player_card_set[card_number].model;
dd.flip = false; 