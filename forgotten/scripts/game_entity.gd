class_name GameEntity extends CharacterBody2D

@export var animated_sprite : AnimatedSprite2D

@export var hit_box : HitBox
@export var hurt_sound : AudioStreamPlayer2D = EnemyHitSound
@export var max_health: int 
@export var health: int 

func _ready() -> void:
	hit_box.Damaged.connect(take_damage)

func take_damage(damage: int) -> void:
	hurt_sound.play()
	health -= damage
	if health <= 0:
		queue_free()
	
