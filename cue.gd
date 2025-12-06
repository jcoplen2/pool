extends Node3D

@export var cue_mass := 0.55 
@export var move_speed := 1.5
@export var rotate_speed := 90.0  
@export var max_strike_power := 1.0
@export var charge_speed := 2.0
@export var strike_distance := 0.25

var current_power := 0.0
var charging := false

@export var cue_ball: RigidBody3D


func _physics_process(delta):
	var dir := Vector3.ZERO

	if Input.is_action_pressed("move_forward"):
		dir.z -= 1
	if Input.is_action_pressed("move_back"):
		dir.z += 1
	if Input.is_action_pressed("move_left"):
		dir.x -= 1
	if Input.is_action_pressed("move_right"):
		dir.x += 1

	if dir != Vector3.ZERO:
		dir = dir.normalized()
		global_position += dir * move_speed * delta

	if Input.is_action_pressed("turn_left"):
		rotate_y(deg_to_rad(rotate_speed * delta))
	if Input.is_action_pressed("turn_right"):
		rotate_y(deg_to_rad(-rotate_speed * delta))

	if Input.is_action_pressed("strike"):
		charging = true
		current_power += charge_speed * delta
		current_power = min(current_power, max_strike_power)

	else:
		if charging:
			strike()
		charging = false
		current_power = 0.0

func strike():
	if cue_ball == null:
		print("ERROR: Cue ball not assigned.")
		return

	var forward = transform.basis.z

	global_position += forward * strike_distance

	cue_ball.apply_impulse(forward * current_power)

	print("STRIKE POWER:", current_power)
