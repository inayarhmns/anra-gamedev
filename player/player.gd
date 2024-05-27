extends CharacterBody2D

var cheat:bool = false
var SPEED = 120.0
const ACC: int = 60
const rotation_speed = 1
@export var friction: int = 70
#@export var maxjumps: int = 1
#@onready var currentjumps: int = 0
@export var zoom_speed = Vector2(0.005, 0.005)
@export var offset_cam_fast = Vector2(0, 5)
@export var offset_cam_slow = Vector2(0, 2)
@export var jump_velo: float = 500
@export var jump_gravity: float = -30
@export var fall_gravity: float = 160
@export var rev_jump_gravity: float = -30
@export var rev_fall_gravity: float = 160
@onready var player_camera = $PlayerCamera
@onready var hurtbox = $hurtbox
@onready var sky_detector = $SkyDetector
@export var anti_gravity = false
@export var is_dead = false
@export var elevated_by_ground = false
@onready var on_fragile_ground = false
@onready var jump_count = 0
var inertia = 100

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	player_camera.offset = Vector2(0, -50)
	player_camera.zoom = Vector2(2.5, 2.5)
#	player_camera.offset = Vector2(0, 80)
#	player_camera.zoom = Vector2(2.1, 2.1)
	
func _physics_process(delta):
	# Handle movement
#	print(get_floor_angle())
#	var inputDirection: Vector2 = input()
#	move(inputDirection)
	flee()
	move_in_gravity()
	jump()
	move_and_slide()
#	stand_direction()
#	for i in get_slide_collision_count():
#		var collision = get_slide_collision(i)
#		if (collision.get_collider().to_string() == "fragile_log:<RigidBody2D#29796336836>"):
#			collision.get_collider().apply_central_impulse(-collision.get_normal() * 500)
	zoom_out_elevate(432, 700, 2.1, 2.5)
	cam_offset_down_elevate(640, 700, 80, -50, offset_cam_fast)
#	zoom_in_elevate(1920, 2400, 2.5, 2.1)
	cam_offset_up_elevate(1616, 1756, -50, 80, offset_cam_slow)
	check_sky()
#	check_non_gravity_area()
	move_no_gravity()
	
#	print(jump_count)
#	print(player_camera.offset.y)
#	print(velocity)
#	print(is_on_ceiling())
	
func flee():
	if (Input.is_action_pressed("interact")):
		cheat = !cheat
	print("flee")
	if (cheat): SPEED = 500
	else: SPEED = 120

func cam_offset_up_elevate(left_pos, right_pos, target_offset, current_offset, speed):
	if (global_position.x >= left_pos && global_position.x <= right_pos):
		if (get_linear_dir() == "right" && player_camera.offset.y >= target_offset):
			player_camera.offset -= speed
		elif (get_linear_dir() == "left" && player_camera.offset.y < current_offset):
			player_camera.offset += speed

	
func cam_offset_down_elevate(left_pos, right_pos, target_offset, current_offset, speed):
	if (global_position.x >= left_pos && global_position.x <= right_pos):
		if (get_linear_dir() == "right" && player_camera.offset.y <= target_offset):
			player_camera.offset += speed
		elif (get_linear_dir() == "left" && player_camera.offset.y > current_offset):
			player_camera.offset -= speed
#	elif (global_position.x > 700):
#		if (player_camera.offset.y > -50):
#			player_camera.offset -= offset_camera_speed
#	elif (global_position.x < left_pos):
#		if (player_camera.offset.y > current_offset):
#			player_camera.offset -= offset_camera_speed 

func zoom_out_elevate(left_pos, right_pos, target_zoom, current_zoom):
	# handle zooming in and out
	if global_position.x >= left_pos && global_position.x <= right_pos:
		var dir = input()
		if(get_linear_dir() == "right" && player_camera.zoom.y >= target_zoom):
			player_camera.zoom -= zoom_speed
		elif (get_linear_dir() == "left" && player_camera.zoom.y <= current_zoom):
			player_camera.zoom += zoom_speed
	# zooming back in after the zooming out position
#	elif (global_position.x > 752 && player_camera.zoom.y <= 2.5):
#		if(get_linear_dir() == "right" && player_camera.zoom.y <= 2.5):
#			player_camera.zoom += zoom_speed
	# zooming back in if going back to the left
	
#	elif (global_position.x < left_pos && get_linear_dir() == "left"):
#		if (player_camera.zoom.y <= current_zoom):
#			player_camera.zoom += zoom_speed
			
func zoom_in_elevate(left_pos, right_pos, target_zoom, current_zoom):
	# handle zooming in and out
	if global_position.x >= left_pos && global_position.x <= right_pos:
		var dir = input()
		if(get_linear_dir() == "right" && player_camera.zoom.y <= target_zoom):
			player_camera.zoom += zoom_speed
		elif (get_linear_dir() == "left" && player_camera.zoom.y >= current_zoom):
			player_camera.zoom -= zoom_speed
	# zooming back in after the zooming out position
#	elif (global_position.x > 752 && player_camera.zoom.y <= 2.5):
#		if(get_linear_dir() == "right" && player_camera.zoom.y <= 2.5):
#			player_camera.zoom += zoom_speed
	# zooming back in if going back to the left
	
#	elif (global_position.x < left_pos && get_linear_dir() == "left"):
#		if (player_camera.zoom.y >= current_zoom):
#			player_camera.zoom -= zoom_speed

func get_linear_dir():
	if (!anti_gravity):
		if input().x == 1:
			return "right"
		elif input().x == -1: 
			return "left"
	else:
		if input().x == 1:
			return "left"
		elif input().x == -1: 
			return "right"

func move(dir):
	velocity = velocity.move_toward(dir*SPEED, ACC)
	
func input() -> Vector2:
	var dir = Vector2.ZERO
	dir.x = Input.get_axis("ui_left", "ui_right")
	dir = dir.normalized()
	return dir

func check_sky():
	var sky_area_collider = sky_detector.get_overlapping_areas()
	if sky_area_collider:
		for area in sky_area_collider:
			if area.get_name() == "SkyLimit":
				velocity = Vector2(0,-get_gravity())
				anti_gravity = true
				is_dead = true
				break

func ground_elevate_self():
#	elevated_by_ground = true
	if(velocity.y >= 0.0):
		velocity.y -= 500
	move_and_slide()

func crate_elevate_self():
	velocity.y = -900
	
	

#func check_non_gravity_area():
#	var sky_area_collider = sky_detector.get_overlapping_areas()
#	if sky_area_collider:
#		for area in sky_area_collider:
#			if area.get_name() == "NonGravityArea":
##				velocity -= Vector2(0,get_gravity())
#				anti_gravity = true
##				print(velocity.y)

func move_in_gravity():
	if !anti_gravity:
		var dir: Vector2 = input()
		move(dir)
		
func move_no_gravity():
	if anti_gravity && !is_dead:
#		print(velocity)
#		velocity.y -= get_gravity()
		var dir = Vector2.ZERO
		var linear_dir = get_linear_dir()
		if linear_dir == "right":
			dir.x = 1
		elif linear_dir == "left" : 
			dir.x = -1
		move(dir)

func anti_gravity_rotate():
	if anti_gravity && !is_dead:
		if (round(rotation) != 3.0):
			rotate(3.1415901184082)
	
func gravitated_rotate():
	if !anti_gravity:
		if (round(rotation) != 0.0):
			rotate(3.1415901184082)


func jump():
	if (!anti_gravity):
		velocity.y += get_gravity()
		if (Input.is_action_pressed("ui_up") && is_on_floor()):
			velocity.y = -jump_velo
			if (on_fragile_ground): 
				jump_count = jump_count + 1
	else:
		velocity.y -= get_reverse_gravity()
		if (Input.is_action_pressed("ui_up") && is_on_ceiling()):
			velocity.y = +1000
			if (on_fragile_ground): jump_count = jump_count + 1
				

#		currentjumps = currentjumps+1
#	if (is_on_floor()):
#		currentjumps = 0

#func handle_fragile_ground():
#	for i in get_slide_collision_count():
#		var collision = get_slide_collision(i)
#		if (collision.get_collider().get_name() == "FragileGround"):
#			on_fragile_ground = true
#			break


func get_gravity():
	return jump_gravity if velocity.y < 0.0 else fall_gravity
#
func get_reverse_gravity():
	return jump_gravity if is_on_ceiling() else fall_gravity
#func stand_direction():
#	if is_on_floor():
#		var floor_angle = get_floor_angle()
##		print(floor_angle)
#		rotation = -floor_angle*0.5
##		print(rotation)
##		rotation -= floor_angle * rotation_speed
##		rotate(-floor_angle)
