/// @desc set fullscreen
//set fullscreen
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