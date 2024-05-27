extends Node2D

var timer : Timer

var gameover_scene = "res://gameover.tscn"
var level1_scene = "res://level1.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#	add_child(timer)
#	# Connect the timeout signal to a function
#	timer = Timer.new()
#	add_child(timer)
#	timer.wait_time = 1.0
#	timer.one_shot = true
#	timer.timeout.connect(Callable(self, "_on_timeout"))
	# Connect the timeout signal to a function using Callable
	


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_area_2d_body_entered(body):
	# Change to the game over scene
	if (body.name == "player"):
		get_tree().change_scene_to_file(level1_scene)
#	get_tree().change_scene(gameover_scene)
	# Start the timer to switch back after 3 seconds
#		_start_timer(0.1)

func _start_timer(duration: float) -> void:
	print("somethinggg")
	get_tree().change_scene_to_file(gameover_scene)
	await get_tree().create_timer(duration).timeout
	print("something")
	# Change back to the original level (level1)
#	get_tree().change_scene_to_file(level1_scene)
	
# Called when the timer times out
func _on_timeout():
	print("asd")
#	get_tree().change_scene_to_file(level1_scene)
	
	# Change back to the original level (level1)
#	get_tree().change_scene_to(level1_scene)
