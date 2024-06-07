extends Area2D






func _on_body_entered(body):
	if (body.get_name() == "player"):
		body.is_dead = true
#		print("anra died")
