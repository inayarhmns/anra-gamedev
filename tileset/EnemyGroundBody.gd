extends StaticBody2D

@onready var collision_enemy_ground = $CollisionEnemyGround
@onready var enemy_ground_polygon = $CollisionEnemyGround/EnemyGroundPolygon
# Called when the node enters the scene tree for the first time.
@onready var hitbox = $hitbox

func _ready():
	enemy_ground_polygon.polygon = collision_enemy_ground.polygon


func _on_hitbox_body_entered(body):
	if (body.get_name() == "player"):
		if (body.global_rotation == 0):
			body.rotate(90)
			print("Anra is dead")
