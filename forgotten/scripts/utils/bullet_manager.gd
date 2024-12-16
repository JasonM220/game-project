extends Node2D

@export var bullet_scene : PackedScene
@export var star_bullet : PackedScene
@export var drone_bullet: PackedScene


func _on_shooter_shoot(pos, dir, type) -> void:
	
	match type:
		Globals.bullet_types.Normal:
			var bullet = bullet_scene.instantiate()
			add_child(bullet)
			pos.y -= 10
			bullet.position = pos
			bullet.direction = dir
		Globals.bullet_types.Star:
			var bullet = star_bullet.instantiate()
			add_child(bullet)
			pos.y -= 10
			bullet.position = pos
			bullet.direction = dir
		Globals.bullet_types.Vertical:
			var bullet = drone_bullet.instantiate()
			add_child(bullet)
			pos.y += 10
			pos.x -= 6
			bullet.position = pos
			bullet.direction = dir
			
	
	
