// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function timer_init(){

	///@argument "timer_string"
	
	//setting up local variable
	var variable_name="timer_"+string(argument0);

	//check if variable exists
	if !variable_instance_exists(id,variable_name)
	{
	    variable_instance_set(id,variable_name,-1);
	}
	    else
	{
	    //countdown timer and set to -1 once reached 0
	    if variable_instance_get(id,variable_name)>0
	    {
	        variable_instance_set(id,variable_name,variable_instance_get(id,variable_name)-1);
	    }
	        else
	    {
	        variable_instance_set(id,variable_name,-1);
	    }
	}
}

function timer_set() {
	///@description timer_get()
	///@argument "timer_string"
	///@argument value

	//check if variable exists
	var variable_name="timer_"+string(argument0);
	variable_instance_set(id,variable_name,argument1);
}

function timer_get() {
	///@description timer_get()
	///@argument "timer_string"

	//check if variable exists
	var variable_name="timer_"+string(argument0);

	if variable_instance_exists(id,variable_name)
	{
	    return variable_instance_get(id,variable_name);
	}
	    else
	{
	    return -1;
	}	
}

function timer_end(timer_string)
{
	if (timer_get(timer_string) > 0 && timer_get(timer_string) - 1 <= 0)
	{
		return true;
	}
	return false;
}