extends CharacterBody2D

const SPEED = 200.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var facing_right: PointLight2D = $facing_right
@onready var facing_left: PointLight2D = $facing_left




func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta



	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	
	
	
	if direction > 0:
		animated_sprite.flip_h = false
		facing_right.visible = true
		facing_left.visible = false
		
	elif direction < 0:
		animated_sprite.flip_h = true
		facing_right.visible = false
		facing_left.visible = true
		
	if direction == 0:
		animated_sprite.play("default")
	else:
		animated_sprite.play("chůze")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
