/// @description move card to graveyard
with (oConstructorTest) {
	opponent_card_set[other.card_number].state = card_state.destroyed;
}

dd = instance_create_depth(x,y,depth,oMonsterDeadAnim);
dd.sprite_index = sprite_index;
dd.image_index = image_index; 