extends Enemy

signal Shoot

@onready var timer: Timer = $Timer

var can_shoot = true

func _process(delta: float) -> void:
	super(delta)
	if can_shoot:
		Shoot.emit(position, direction)
		can_shoot = false
		timer.start(1)
	

func _on_timer_timeout() -> void:
	can_shoot = true
