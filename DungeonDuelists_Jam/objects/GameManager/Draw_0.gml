/// @description Insert description here
#region draw arrow for weakest enemy
	var target = find_lowest_defense_enemy(); 
	if target != noone && instance_exists(oMonsterPlayer)
		draw_sprite_ext(sArrow_simple_down,0,target.x,target.y-20,1,1,0,c_white,0.7); 
#endregion



