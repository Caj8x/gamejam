extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = 300.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	# Handle jump.
	var dir = Vector2.ZERO
	dir.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	dir.y = Input.get_action_strength("backward") - Input.get_action_strength("forward")

	velocity = dir.normalized() * SPEED
	move_and_slide()
