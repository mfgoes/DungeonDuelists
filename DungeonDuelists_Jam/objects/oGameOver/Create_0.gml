/// @description Master button
// You can write your code in this editor
text = "Game Over";
btn_alpha = 1;
image_speed = 0;

x = room_width/2;
y = room_height/2-50;

//create other buttons
with(instance_create_depth(x,y+30,0,oButton))
	btn_type = 3; //restart button

if room_next(room) != -1 { //if there's a next room, create this button too
	with(instance_create_depth(x,y+50,0,oButton))
		btn_type = 4;
}