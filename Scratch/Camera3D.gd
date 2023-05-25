extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	if Input.is_action_pressed("ui_up"):
		position.z -=0.01
	if Input.is_action_pressed("ui_down"):
		position.z += 0.01
