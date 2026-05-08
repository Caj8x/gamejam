extends CharacterBody2D

@export var speed := 200
@export var max_hp := 100

var hp := 100
var has_fire := false
var fuel := 0

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	# POHYB
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	
	velocity = direction.normalized() * speed
	move_and_slide()
	
	# ÚTOK OHNĚM
	if Input.is_action_just_pressed("attack"):
		attack()


func attack():
	if has_fire and fuel > 0:
		fuel -= 1
		
		#var fire = preload("res://FireAttack.tscn").instantiate()
		#fire.position = position + Vector2(20, 0) # před hráčem
		
		#get_parent().add_child(fire)
