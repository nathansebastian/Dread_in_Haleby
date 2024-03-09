extends Sprite3D
var position3D 
var grabbing_gun:bool
@onready var _raycast = $"../RayCast3D"
@export var target_reciever:String = ""
func _process(delta):
	var camera = $"../../Camera3D"
	var z = 0
	var position2D = get_viewport().get_mouse_position()
	var dropPlane  = Plane(Vector3(0, 0, 10), z)
	position3D = dropPlane.intersects_ray(camera.project_ray_origin(position2D),camera.project_ray_normal(position2D))
	
	if(grabbing_gun):
		$"..".global_position = position3D
		if(Input.is_action_just_pressed("left_click")):
			shoot()
		
	
	
func shoot() -> void:
	if _raycast.is_colliding():
		var target = _raycast.get_collider()
		if(target != null):
			print(target.name)
			if(target.has_node(target_reciever)):
				var _target = target.get_node(target_reciever)
				_target.on_receiver_called(self)
				
	

func _on_static_body_3d_mouse_entered():
	pass
	#has_mouse_entered = true


func _on_static_body_3d_mouse_exited():
	pass
	#has_mouse_entered = false
	


func _on_static_body_3d_input_event(camera, event, position, normal, shape_idx):
		
	if Input.is_action_just_pressed("right_click"):
		grabbing_gun = not grabbing_gun
