extends StaticBody2D

# Called when the node enters the scene tree for the first time.
@onready var collision_polygon_2d = $CollisionPolygon2D
@onready var polygon_2d = $CollisionPolygon2D/Polygon2D
@onready var jump_collision_polygon_2d_2 = $JumpCollisionPolygon2D2
@onready var jump_polygon = $JumpCollisionPolygon2D2/JumpPolygon
@onready var fragile_ground = $FragileGround
@onready var fragile_polygon = $FragileGround/FragilePolygon
@onready var jump_collision_polygon_2 = $JumpCollisionPolygon2
@onready var jump_polygon_2 = $JumpCollisionPolygon2/JumpPolygon2
@onready var enemy_coll_polygon = $EnemyCollPolygon
@onready var enemy_polygon = $EnemyCollPolygon/EnemyPolygon



func _ready():
	polygon_2d.polygon = collision_polygon_2d.polygon
	jump_polygon.polygon = jump_collision_polygon_2d_2.polygon
	fragile_polygon.polygon = fragile_ground.polygon
	jump_polygon_2.polygon = jump_collision_polygon_2.polygon
	enemy_polygon.polygon = enemy_coll_polygon.polygon
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
