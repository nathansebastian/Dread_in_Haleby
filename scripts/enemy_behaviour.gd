extends StaticBody3D
signal enemy_attacked(damage:int)
@export var health:int = 10
@export var has_hit:bool = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func hit(sender) -> void:
	var _damage:int
	if("damage" in sender):
		_damage = sender.damage
	else:
		_damage = 4
	health -= _damage
	if health <= 0:
		queue_free()


func _on_attack_cooldown_timeout():
	$AnimationPlayer.play("wind_up")
	await get_tree().create_timer(1.5).timeout
	apply_damage()
	
func apply_damage():
		print("player is hit")# Replace with function body.
		var damage:int = 4
		enemy_attacked.emit(damage)
