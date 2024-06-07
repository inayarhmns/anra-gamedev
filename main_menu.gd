extends Node2D

@onready var parallax_background_2 = $ParallaxBackground2


func _physics_process(delta):
#	$clouds.scroll_offset.x -= 400* delta;/
	parallax_background_2.scroll_offset.x -= 700 * delta;
	


func _on_play_pressed():
	get_tree().change_scene_to_file("res://level1.tscn")




func _on_control_pressed():
	get_tree().change_scene_to_file("res://ui/controlscene.tscn")


func _on_quit_pressed():
	get_tree().quit()
