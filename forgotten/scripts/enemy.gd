class_name Enemy extends Node2D


const SPEED = 60

var direction = 1

@export var ray_cast_right: RayCast2D
@export var ray_cast_left: RayCast2D
@export var animated_sprite: AnimatedSprite2D
@export var hit_box: HitBox

func _ready() -> void:
	hit_box.Damaged.connect(take_damage)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite	.flip_h = false
	position.x += direction * SPEED * delta
	
func take_damage(_damage: int) -> void:
	print("die")
	queue_free()
