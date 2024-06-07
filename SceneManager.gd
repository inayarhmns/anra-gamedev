extends Node2D

# Declare the two scenes to switch to
var Level = 1
var scene1 = ""
var scene2 = ""
var is_emilium = false
var timer: Timer

func _ready():
	# Ensure the singleton persists across scene changes
	set_process(true)
	timer = Timer.new()
	timer.wait_time = 0.7
	timer.one_shot = true
	timer.timeout.connect(self._on_Timer_timeout)
	add_child(timer)

# Function to start the timer and change to the first scene
func start_timer(scene_name, scene_name2):
	scene1 = scene_name
	scene2 = scene_name2
	_change_scene(scene1)
	timer.start()

# Function called when the timer times out
func _on_Timer_timeout():
	if !is_emilium:
		is_emilium = true
		_change_scene(scene1)
		timer.start()
	else:
		_change_scene(scene2)

# Function to change the scene
func _change_scene(scene_name):
	get_tree().change_scene_to_file(scene_name)
