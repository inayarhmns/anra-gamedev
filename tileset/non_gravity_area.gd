extends Area2D

#func _on_area_entered(area):
#	if (area.get_name() == "SkyDetector"):
		
func _on_body_entered(body):
	if (body.get_name() == "player"):
		body.anti_gravity_rotate()


func _on_body_exited(body):
	if (body.get_name() == "player"):
		body.anti_gravity = false
		body.gravitated_rotate()
