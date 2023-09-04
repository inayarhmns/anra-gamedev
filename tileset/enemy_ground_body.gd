extends Area2D



func _on_body_entered(body):
	if (body.get_name() == "player"):
		body.is_dead = true
		if (body.global_rotation == 0):
			body.rotate(90)
			print("Anra is dead")
