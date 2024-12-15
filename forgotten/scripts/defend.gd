extends State

@onready var defend_zone_left: Area2D = $"../../DefendZoneLeft"

@onready var defend_zone_right: Area2D = $"../../DefendZoneRight"

@export
var idle_state: State
@export
var move_state: State


func enter() -> void:
	super()
	if parent.animated_sprite.flip_h:
		defend_zone_left.monitorable = true
	else:
		defend_zone_right.monitorable = true


func exit() -> void:
	super()
	defend_zone_right.monitorable = false
	defend_zone_left.monitorable = false
		
	

	

	
func process_frame(delta: float) -> State:
	if Input.is_action_pressed("defend"):
		return null
	return idle_state

func process_input(event: InputEvent) -> State:
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		return move_state
	return null
	
