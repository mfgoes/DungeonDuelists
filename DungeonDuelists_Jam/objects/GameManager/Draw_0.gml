/// @description other UI elements
// Draw the arrow sprite on top of the object with the lowest defense
var weakest_enemy = find_lowest_defense_enemy(); 
if weakest_enemy != noone && instance_exists(oMonsterPlayer)
	draw_sprite(sArrow_simple_down, 0, weakest_enemy.x, weakest_enemy.y-25);