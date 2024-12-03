class_name Shooter extends Enemy

signal Shoot

@onready var timer: Timer = $Timer

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var can_shoot = true

func _process(delta: float) -> void:
	super(delta)
	if can_shoot:
		speed = 0
		Shoot.emit(position, direction)
		animated_sprite_2d.play("shoot")
		can_shoot = false
		timer.start(1)
	

func _on_timer_timeout() -> void:
	can_shoot = true


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "shoot":
		animated_sprite_2d.play("walk")
		speed = 60
