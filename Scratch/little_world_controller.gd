extends Node3D

@onready var camera_3d = $Camera3D
@export_range(-10., 10.) var zoom = 5.
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	camera_3d.position.z = zoom
