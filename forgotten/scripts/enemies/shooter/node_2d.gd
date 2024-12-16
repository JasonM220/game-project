class_name Shooter extends Enemy

signal Shoot

@export var timer: Timer

@export var ray_cast_down_right: RayCast2D = null
@export var ray_cast_down_left: RayCast2D = null


var bullet: Globals.bullet_types = Globals.bullet_types.Normal

var can_shoot = true

func _process(delta: float) -> void:
	super(delta)
	check_edge()
	if can_shoot:
		speed = 0
		Shoot.emit(position, direction, bullet)
		animated_sprite.play("shoot")
		can_shoot = false
		timer.start(randf_range(1.0, 1.5))
	

func _on_timer_timeout() -> void:
	can_shoot = true


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite.animation == "shoot":
		animated_sprite.play("walk")
		speed = 60
		
func check_edge() -> void:
	if not ray_cast_down_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if not ray_cast_down_left.is_colliding():
		direction = 1
		animated_sprite	.flip_h = false
	
