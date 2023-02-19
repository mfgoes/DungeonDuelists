/// @description show your deck
draw_set_font(fnt_Arial);
var line_height = 12; 

//your hand: 
for (var i = 0; i < 3; i++) 
{
	draw_text(12,line_height*i+12,"hand: " + string(your_hand[i]));  
}

//your deck: 

for (var i = 0; i < array_length(your_deck); i++) 
{
	draw_text(12,line_height*i+room_height,"deck: " + string(your_deck[i]));  
}

//misc
var RES = 2; 
draw_text(12,room_height*RES-line_height*2,"Click R to repick hand"); 