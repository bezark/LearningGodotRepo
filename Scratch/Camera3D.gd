extends Camera3D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	if Input.is_action_pressed("ui_up"):	
		move()
		
		
	if Input.is_action_pressed("ui_down"):	
		position.z += 0.1	
	

func move():
	var tween = create_tween()
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property(self, "position", Vector3(0.,0.,0.1), 20.)
