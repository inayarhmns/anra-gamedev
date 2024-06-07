extends StaticBody2D


@onready var polygon_collision2d = $CollisionPolygon2D
@onready var polygon2d = $CollisionPolygon2D/Polygon2D
# Called when the node enters the scene tree for the first time.



func _ready():
	polygon2d.polygon = polygon_collision2d.polygon
