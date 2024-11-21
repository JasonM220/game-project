extends "res://scripts/state.gd"

@export
var idle_state: State
@export
var move_state: State

func enter() -> void:
	super()
	parent.animations.offset = Vector2(0, 20)

func exit() -> void:
	super()
	parent.animations.offset = Vector2(0, 0)
	
func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta

	var movement = Input.get_axis('move_left', 'move_right') * move_speed
	
	if movement != 0:
		parent.animations.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement != 0:
			return move_state
		return idle_state
	return null
