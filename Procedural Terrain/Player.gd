extends CharacterBody2D


@export var SPEED = 64
const JUMP_VELOCITY = -400.0
signal moving

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		position.x -= SPEED
		emit_signal("moving")
	if Input.is_action_pressed("ui_right"):
		position.x += SPEED
		emit_signal("moving")
	if Input.is_action_pressed("ui_up"):
		position.y -= SPEED
		emit_signal("moving")
	if Input.is_action_pressed("ui_down"):
		position.y += SPEED 
		emit_signal("moving")
