class_name Enemy extends GameEntity


var direction = 1

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


@export var speed = 60
@export var ray_cast_right: RayCast2D
@export var ray_cast_left: RayCast2D


func _ready() -> void:
	super()
	
func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	move_and_slide()

func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite	.flip_h = false
	velocity.x = direction * speed
	
func take_damage(damage: int) -> void:
	super(damage)
	
