/// @description this is a simple textbox that fades out after a few seconds
//this can also be used for damage counters. 
str = "ERROR";
_x = x; 
_y = y; 
_xstart = xstart;  
_ystart = ystart;
_x += 10; //anim


alarm[0] = 1.5 * room_speed; 
alarm[1] = 10; //flash effect

enum variant
    {
        normal,
        damage, 
        error,
        tutorial 
    }
toast_type = variant.normal; 