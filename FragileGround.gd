extends CollisionPolygon2D


@onready var fragile_area = $FragileArea
@onready var fragile_surface = $FragileSurface
@export var crushable = false


#func _on_body_entered(body):
#	if (body.get_name() == "player"):
#		body.on_fragile_ground = true
#
#
#func _physics_process(delta):
#	for body in fragile_area.get_overlapping_bodies():
#		if (body.get_name() == "player" && body.jump_count >= 3):
#			crushable = true
#			body.jump_count = 0
#			break

#func crush_ground():
#
##	if (crushable):
##		for i in get_slide_collision_count():
##			var collision = get_slide_collision(i)
##			if (collision.get_collider().to_string() == "fragile_log:<RigidBody2D#29796336836>"):
##				collision.get_collider().apply_central_impulse(-collision.get_normal() * 500)


#
##
#func _on_body_exited(body):
#	if (body.get_name() == "player"):
#		body.jump_count = 0


func _on_fragile_area_body_entered(body):
	if (body.get_name() == "player"):
		body.on_fragile_ground = true


func _on_fragile_area_body_exited(body):
	if (body.get_name() == "player"):
		body.jump_count = 0


func _on_fragile_surface_body_entered(body):
	if (body.get_name() == "player" && body.jump_count >= 3):
		body.jump_count = 0
		queue_free()
		
