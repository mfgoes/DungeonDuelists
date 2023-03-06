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
