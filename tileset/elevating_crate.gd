extends CharacterBody2D

#@onready var polygon_2d = $CollisionPolygon2D/Polygon2D
#@onready var collision_polygon_2d = $CollisionPolygon2D
#@onready var area_2d = $Area2D
#@onready var area_interact = $area_interact
const dir = Vector2(-1,0)
const SPEED = -1000000.0
const ACC = -50
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#var player = preload("res://player/player.tscn")

func _on_area_elevating_body_entered(body):
#	print(body.get_name())
	if(body.get_name() == "player"):
		body.crate_elevate_self()
#		body.Camera2D.zoom.x -= 0.5
#		body.Camera2D.zoom.y -= 0.5
#		body.Camera2D.zoom
#	body.velocity = body.velocity.move_toward(dir*SPEED, ACC)
	
	


#func _physics_process(delta):
#	velocity = velocity.move_toward(dir*SPEED, ACC)
#	print("kok")

#func _on_area_interact_body_entered(body):
#	if (body.get_name() == "player"):
#		print("interacting...")
##		self.velocity = self.velocity.move_toward(dir*SPEED, ACC)
#		velocity.x = velocity.x + body.velocity.x
#		self.move_and_slide()
##		 body.velocity;
##		print(body.velocity)
##	if (Input.is_action_pressed("interact")):
#
