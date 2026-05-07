extends CharacterBody2D

@export var speed := 100
@export var damage := 10

var player = null

func _physics_process(delta):
	if player:
		var dir = (player.global_position - global_position).normalized()
		velocity = dir * speed
		move_and_slide()

func _on_body_entered(body):
	if body.has_method("fire_hp"):
		body.fire_hp -= damage
