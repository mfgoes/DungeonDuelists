// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function play_sound_atk() {
	var sound = choose(Punch_1_3,Punch_1_4,Punch_1_5); 
	audio_play_sound(sound,0,0,0.4,); 
}

function play_sound_btn() {
	var sound = choose(TomWinandySFX_UI_ScifiTech_Button_Select_32); 
	audio_play_sound(sound,0,0); 
}

function play_sound_coin() {
	var sound = choose(Coins_01); 
	audio_play_sound(sound,0,0); 
}

function play_sound_error() {
	var sound = choose(TomWinandySFX_UI_ScifiTech_Button_Select_55); 
	audio_play_sound(sound,0,0); 
}

function play_sound_hover() {
	var sound = choose(Bag_01,Bag_02);
	audio_play_sound(sound,0,0,0.5); 
}