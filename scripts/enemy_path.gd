extends Sprite3D

@export var start_pos:float
@export var end_pos:float
@export var duration:float

# Called when the node enters the scene tree for the first time.
func _ready():
	_tween_start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func  _tween_start():
	var _tween = get_tree().create_tween()
	_tween.set_loops()
	_tween.tween_property($"..","position:x",start_pos,duration).set_trans(Tween.TRANS_QUAD)
	_tween.tween_property($"..","position:x",end_pos,duration).set_trans(Tween.TRANS_QUAD)
