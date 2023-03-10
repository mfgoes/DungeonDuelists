/// @description move card to graveyard
with (oConstructorTest) {
	opponent_card_set[other.card_number].state = card_state.destroyed;
}