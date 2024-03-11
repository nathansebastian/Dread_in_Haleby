extends Node

var health:int = 20:
	set(value):
		health = value
		health = limit_value(health,20)
		
		
var ammo:int = 10


func limit_value(value:int, max_value:int):
	if(value < 0):
		value = 0
	elif(value > max_value):
		value = max_value
	return value
	


	
