extends CharacterBody2D

@export var speed := 200.0
@export var fire_hp := 100.0
@export var fire_decay := 2.0
@export var attack_cost := 10.0

func _on_stick_body_entered(body):
	if body.name == "Stick":
		body.add_fuel(20)
		queue_free()

func _physics_process(delta):

	# 🔥 ubývání ohně
	fire_hp -= fire_decay * delta
	if fire_hp <= 0:
		get_tree().reload_current_scene()

	# 🎮 pohyb
	var dir = Vector2.ZERO
	dir.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	dir.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")

	velocity = dir.normalized() * speed
	move_and_slide()

	# 🔥 útok ohněm
	if Input.is_action_just_pressed("attack"):
		attack()

func attack():
	if fire_hp < attack_cost:
		return
	
	fire_hp -= attack_cost
	print("ohnivý útok")
