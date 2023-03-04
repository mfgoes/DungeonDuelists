/// @description show your deck

if (live_call()) return live_result;

#region setup
	draw_set_font(fnt_BodyRegular);
	var line_height = 12; 
#endregion

//your hand: 
for (var i = 0; i < array_length(your_hand); i++) 
{
	
	//if array_get(your_hand,i) = array_get(your_deck,i)
	//	draw_set_color(c_red);
	//else 
	draw_set_color(c_white); 
	draw_text(12,line_height*i+12,"hand: " + string(your_hand[i]));  
}

//your deck: 

for (var i = 0; i < array_length(your_deck); i++) 
{
	
	#region //if deck card is hand card, make it yellow. 
	for (var h = 0; h < array_length(your_deck); h++) { //compare all the deck cards to your first hand (automate later)
		if array_get(your_deck,i) = array_get(your_hand,0)
			draw_set_color(c_yellow);
		else draw_set_color(c_white);
		}	
	#endregion
	
	draw_text(12,line_height*i+room_height,"deck: " + string(your_deck[i]));  
}

//misc
var RES = 2; 
draw_text(12,room_height*RES-line_height*2,"Click R to repick hand"); 