extends RigidBody3D

@export var stop_threshold := 0.05

func _physics_process(delta):
	if linear_velocity.length() < stop_threshold:
		linear_velocity = Vector3.ZERO
