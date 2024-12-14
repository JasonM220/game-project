class_name Shooter extends Enemy

signal Shoot

@export var timer: Timer



var bullet: Globals.bullet_types = Globals.bullet_types.Normal

var can_shoot = true

func _process(delta: float) -> void:
	super(delta)
	if can_shoot:
		speed = 0
		Shoot.emit(position, direction, bullet)
		animated_sprite.play("shoot")
		can_shoot = false
		timer.start(1)
	

func _on_timer_timeout() -> void:
	can_shoot = true


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite.animation == "shoot":
		animated_sprite.play("walk")
		speed = 60
