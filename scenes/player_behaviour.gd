extends Node

func alter_health(damage:int) -> void:
	$"../Player".health -= damage
	print($"../Player".health)


func _on_enemy_enemy_attacked(damage):
	alter_health(damage)
