class_name HurtBox extends Area2D

@export
var damage: int = 1

func _ready() -> void:
	area_entered.connect( do_damage )

func do_damage(a: Area2D) -> void:
	if a is HitBox:
		a.take_damage(damage)
