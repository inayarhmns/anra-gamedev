extends Control
@onready var zoom_out_area = $ZoomOutArea
@onready var player = $player

# Called when the node enters the scene tree for the first time.
func _ready():
	var current_camera = get_viewport().get_camera_2d()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
#	print(get_viewport().get_camera_2d().zoom)


#func _on_zoom_out_area_body_entered(body):
#	if (body.get_name() == "player"):
#		print("udah")
#		var current_camera = get_viewport().get_camera_2d()
#		print(player.position)
#		while (current_camera.zoom@onready var player = $player


