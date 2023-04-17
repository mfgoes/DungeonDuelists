/// @description Insert description here
// You can write your code in this editor
#region basic controls
	if (keyboard_check_pressed(vk_f1) || keyboard_check_pressed(ord("0")))
	{
	if window_get_fullscreen()
		{
		window_set_fullscreen(false);
		}
	else
		{
		window_set_fullscreen(true);
		}
	}
	
	if (keyboard_check_pressed(vk_escape)) {
		game_restart(); 	
	}
	if (keyboard_check_pressed(ord("9"))) || (keyboard_check_pressed(ord("1"))) {
		global.debugmode = !global.debugmode; 
	}
#endregion

///check who's turn it is. Move this to script later. 
timer_init("opponent_turn");
timer_init("player_turn");

if (battle_started) && winner = 0 {
    process_turn();
} else {
    // Check if player already lost
    if winner > 0 && !instance_exists(oGameOver) {
        with (oButton) instance_destroy();
        dd = instance_create_depth(0, 0, 0, oGameOver);
        dd.winner = winner;

        // Reset the battle state and spawn new monsters for the next battle
        battle_started = false;
    }
}
