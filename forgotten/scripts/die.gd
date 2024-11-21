extends State

@export var timer: Timer

func enter() -> void:
	super()
	Engine.time_scale = 0.5
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
	
	
func exit() -> void:
	super()

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.velocity.x = 0
	parent.move_and_slide()
	
	return null
