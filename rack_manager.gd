extends Node3D

@export var ball_spacing: float = 0.057
@export var rack_origin: Node3D       
@export var balls: Array[Node3D]      

func _ready():
	rack_balls()


func rack_balls():
	if rack_origin == null:
		return

	var origin = rack_origin.global_position
	var index = 0
	var rows = 5

	for row in range(rows):
		for col in range(row + 1):
			if index >= balls.size():
				return

			var z_offset = -row * ball_spacing
			var x_offset = (col - row * 0.5) * ball_spacing

			var pos = origin + Vector3(x_offset, 0, z_offset)
			balls[index].global_position = pos

			index += 1
