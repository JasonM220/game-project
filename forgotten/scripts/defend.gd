extends State

@onready var hurt_box: HurtBox = $"../../Interactions/HurtBox"

@export
var idle_state: State
@export
var move_state: State


func enter() -> void:
	super()

func exit() -> void:
	super()

	

	
func process_frame(delta: float) -> State:
	if Input.is_action_pressed("defend"):
		return null
	return idle_state

func process_input(event: InputEvent) -> State:
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		return move_state
	return null
	
