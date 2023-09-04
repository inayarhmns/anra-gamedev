extends CharacterBody2D

@onready var polygon_2d = $vertical_log/Polygon2D
@onready var vertical_log = $vertical_log


# Called when the node enters the scene tree for the first time.
func _ready():
	polygon_2d.polygon = vertical_log.polygon


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

