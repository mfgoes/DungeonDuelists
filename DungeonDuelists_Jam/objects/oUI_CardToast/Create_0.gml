/// @description this is a simple textbox that fades out after a few seconds
//this can also be used for damage counters. 
str = "no monsters to use";
_x = room_width * global.TEXT_RES / 2;
_xstart = _x; 
_x += 10; //anim
_y = 50;
alarm[0] = 1.5 * room_speed; 