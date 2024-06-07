extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	SceneManager.Level = 2
	var current_camera = get_viewport().get_camera_2d()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
