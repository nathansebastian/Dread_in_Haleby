extends Sprite3D

@export var start_pos:float
@export var end_pos:float
@export var duration:float
var _tween
var colour_tween

# Called when the node enters the scene tree for the first time.
func _ready():
	_tween = get_tree().create_tween()
	#colour_tween = get_tree().create_tween()
	_tween_start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func  _tween_start():

	_tween.set_loops()
	_tween.tween_property($"..","position:x",start_pos,duration).set_trans(Tween.TRANS_QUAD)
	$"../AttackCooldown".start()
	#colour_tween.tween_property($".","modulate:r",0.1,2).set_trans(Tween.TRANS_QUAD)
	_tween.tween_property($"..","position:x",end_pos,duration).set_trans(Tween.TRANS_QUAD)


func _on_attack_cooldown_timeout():
	_tween.pause()

func resume_tween():
	_tween.play()
