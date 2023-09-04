extends StaticBody2D

@onready var area_2d = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _physics_process(delta):
#	for i in area_2d.get_overlapping_areas():
#		print(i.get_name())




func _on_area_2d_body_entered(body):
	if (body.get_name() == "player"):
		body.anti_gravity = true
		body.ground_elevate_self()
#		if(body.velocity.y >= 0.0):
#			body.velocity.y -= 2000
#		body.move_and_slide()
		
