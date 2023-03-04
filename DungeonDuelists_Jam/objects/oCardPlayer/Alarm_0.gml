/// @description "use" card and destroy object
if (live_call()) return live_result;

instance_destroy(); 
//generate monster

var target = id; if instance_exists(oStagePlayer) target = oStagePlayer; 
var spawn_location = 0; 


//to do: needs refinement

//spawn an enemy in an empty spot on the board
if oConstructorTest.card_slots[0,0] = 0 {
	oConstructorTest.card_slots[0,0] = 1;
	spawn_location = oConstructorTest.card_slots[0,1]; 
} else
if oConstructorTest.card_slots[1,0] = 0 {
	oConstructorTest.card_slots[1,0] = 1;
	spawn_location = oConstructorTest.card_slots[1,1]; 
} else
if oConstructorTest.card_slots[2,0] = 0 {
	oConstructorTest.card_slots[2,0] = 1;
	spawn_location = oConstructorTest.card_slots[2,1]; 
}
else spawn_location = 0; 

dd = instance_create_depth(target.x + spawn_location,target.y-10+choose(0,2,4),depth,oMonsterPlayer); 
dd.card_number = card_number; 
dd.spawn_location = spawn_location; 
