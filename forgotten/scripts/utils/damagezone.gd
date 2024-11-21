extends Area2D

@export
var damage: int

func _on_body_entered(body: Node2D) -> void:
	print("hit")
	body.hit(damage)
