extends Node

var score = 0

@onready var score_label: Label = $scorelabel

func add_point():
	score += 1
	score_label.text = "You colected " + str(score) + " coins."
