extends Node

var score = 0
@onready var score_label: Label = $ScoreLabel

func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + "coins."


func _on_shooter_shoot() -> void:
	pass # Replace with function body.
