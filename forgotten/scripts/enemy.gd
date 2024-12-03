class_name Enemy extends CharacterBody2D


var speed = 60

var direction = 1

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


@export var ray_cast_right: RayCast2D
@export var ray_cast_left: RayCast2D
@export var animated_sprite: AnimatedSprite2D
@export var hit_box: HitBox

func _ready() -> void:
	hit_box.Damaged.connect(take_damage)
	
func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite	.flip_h = false
	velocity.x = direction * speed
	
func take_damage(_damage: int) -> void:
	print("die")
	queue_free()
