extends Area2D


# Declare the two scenes to switch to
var scene1 = "res://ui/emilium.tscn"
var scene2 = "res://level_2.tscn"
var is_scene1 = false
# Timer variables
var timer: Timer

# Function to initialize the timer
#func _ready():
#	timer = Timer.new()
#	timer.wait_time = 1.0
#	timer.one_shot = true
#	timer.timeout.connect(self._on_Timer_timeout)
#	add_child(timer)

# Function called when a body enters the area
#func _on_Area2D_body_entered(body: Node):
#	if body.is_in_group("Player"):  # Assuming the player is in a group named "Player"
#		timer.start()

# Function called when the timer times out
#func _on_Timer_timeout():
#	if !is_scene1:
#		print("change first scene")
#		is_scene1 = true
#		_change_scene(scene1)
#		timer.wait_time = 1.0  # Reset wait time to 1 second
#		timer.start()  # Start timer again for the second change
#	else:
#		_change_scene(scene2)
#
## Function to change the scene
#func _change_scene(scene_name):
#	get_tree().change_scene_to_file(scene_name)

func _on_body_entered(body):
	if (body.get_name() == "player"):
		SceneManager.start_timer(scene1, scene2)
#		queue_free()
