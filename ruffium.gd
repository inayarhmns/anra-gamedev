extends Area2D

var scene1 = "res://ui/win_scene.tscn"
var scene2 = "res://main_menu.tscn"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if (body.get_name() == "player"):
		SceneManager.start_timer(scene1, scene2)
