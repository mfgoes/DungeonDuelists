/// @description Insert description here
//smooth enter
if entrance_anim = true {
x = lerp(x,xstart,0.1);
if round(x) = xstart entrance_anim = false; //exit animation
}
if image_alpha < 1 image_alpha +=0.05; 