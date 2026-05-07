extends Area2D

@export var fuel_value := 20

func _on_body_entered(body):
	if body.name == "Player":
		body.add_fuel(fuel_value)
		queue_free()
