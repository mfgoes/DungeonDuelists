// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scaling_HTML5(){
	if os_browser != browser_not_a_browser {
		if display_get_width()!=window_get_width() {
		    // resize window to display
		    window_set_size(display_get_width(),display_get_height());
		}
	}
	
	
#region scaling text to fit properly (may have to be moved out of step to save performance
	if os_browser != browser_not_a_browser {
		var originalWidth = 840;
		var originalHeight = 480;
		var RES =global.RES_GUI;
		var scaleX = display_get_width() / originalWidth;
		var scaleY = display_get_height() / originalHeight;
		var minimumScale = min(scaleX, scaleY);
		var offsetX = (display_get_width() - (originalWidth * minimumScale)) / 2;
		var offsetY = (display_get_height() - (originalHeight * minimumScale)) / 2;
		display_set_gui_maximise(minimumScale, minimumScale, offsetX, offsetY);
		draw_text((x)*RES,(y-2)*RES,text);
	}
#endregion
}

function font_setup() {
	self.font = font_add("Inter-Regular.ttf", 24,false,false,32,127);
	font_enable_sdf(self.font,true); 
	
	self.font_bold = font_add("HelveticaNeue-Bold.otf", 24,false,false,32,127);
	font_enable_sdf(self.font_bold,true); 
}
