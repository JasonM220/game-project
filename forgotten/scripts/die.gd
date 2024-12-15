extends State

@export var timer: Timer
@export var idle_state : State


var died =  false

func enter() -> void:
	super()
	died =  false
	Engine.time_scale = 0.5
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	died = true
	
func process_frame(delta: float) -> State:
	if died:
		parent.position = parent.checkpoint_manager.last_location
		parent.health = parent.max_health
		return idle_state
	return null
	
	
	
func exit() -> void:
	super()

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.velocity.x = 0
	parent.move_and_slide()
	
	return null
