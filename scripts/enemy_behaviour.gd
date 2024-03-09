extends StaticBody3D
var health:int = 10

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
