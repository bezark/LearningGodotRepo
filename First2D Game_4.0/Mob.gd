extends RigidBody2D


func _ready():
	$AnimatedSprite2D.playing = true
	var mob_types = $AnimatedSprite2D.frames.get_animation_names()
	$AnimatedSprite2D.animation = mob_types[randi()%mob_types.size()]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
