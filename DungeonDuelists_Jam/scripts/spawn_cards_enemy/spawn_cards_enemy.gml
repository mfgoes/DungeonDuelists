// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawn_cards_enemy(){

	//keep it basic for now
	var _x = oStageEnemy.x + 4; 
	var _y = oStageEnemy.y - 10; 
	
	repeat(2) {
		_x += 34;
		instance_create_depth(_x,_y,depth-20,oMonsterEnemy);
	}
}