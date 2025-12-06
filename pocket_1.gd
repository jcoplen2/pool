extends Area3D

@export var cue_spawn: Node3D

func _on_body_entered(body):
	if body.name == "CueBall":
		reset_cue_ball(body)
		return

	if body is RigidBody3D:
		body.queue_free()

func reset_cue_ball(ball: RigidBody3D) -> void:
	if cue_spawn == null:
		print("ERROR: cue_spawn not assigned on", name)
		return

	ball.global_position = cue_spawn.global_position
	ball.linear_velocity = Vector3.ZERO
	ball.angular_velocity = Vector3.ZERO
