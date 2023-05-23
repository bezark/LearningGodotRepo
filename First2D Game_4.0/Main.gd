extends Node

@export var mob_scene: PackedScene
var score

func _ready():
	randomize()
#	new_game()


func game_over():
		$ScoreTimer.stop()
		$MobTimer.stop()
		$HUD.show_game_over()
		$Music.stop()
		$DeathSound.play()
	
func new_game():
		score = 0
		$Music.play()
		$HUD.update_score(score)
		$HUD.show_message("Get Ready")
		$Player.start($StartPosition.position)
		$StartTimer.start()
		get_tree().call_group("mobs", "queue_free")
		

func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	
func _on_MobTimer_timeout():
	var mob = mob_scene.instantiate()
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.offset = randi()
	
	var direction = mob_spawn_location.rotation+ PI / 2
	
	mob.position = mob_spawn_location.position
	
	direction += randf_range(-PI/4 , PI/4)
	mob.rotation = direction
	
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	add_child(mob)


func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)
	
