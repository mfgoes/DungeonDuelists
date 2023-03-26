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
		room_restart(); 	
	}
	if (keyboard_check_pressed(ord("9"))) || (keyboard_check_pressed(ord("1"))) {
		global.debugmode = !global.debugmode; 
	}
#endregion



//check who's turn it is. Move this to script later. 
timer_init("opponent_turn");

if turn_to_play = 1 { //opponents turn
	if timer_get("opponent_turn") <= 0 {
		opponent_start_turn(); //triggers the code for the monsters. also checks what action to do first. 
		timer_set("opponent_turn",50+irandom(25)); 	
	}

	if timer_get("opponent_turn") = 1 {
		turn_to_play = 0;	
		timer_set("opponent_turn",-1);
	}
	
	first_move = false; 
}

if turn_to_play = 0 && first_move = false {
	//pick card from deck	
}

//check win condition
check_win_condition(); 
