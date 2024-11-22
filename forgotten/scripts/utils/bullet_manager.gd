extends Node2D

@export var bullet_scene : PackedScene


func _on_shooter_shoot(pos, dir) -> void:
	var bullet = bullet_scene.instantiate()
	add_child(bullet)
	pos.y -= 10
	bullet.position = pos
	bullet.direction = dir
	#bullet.add_to_group("bullets")  MIGHT NEED THIS lATER
	
