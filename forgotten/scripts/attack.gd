extends State

@export
var idle_state: State
@export
var move_state: State

var finished = false



func enter() -> void:
	super()
	if parent.animations.flip_h:
		parent.animations.offset = Vector2(-32, 0)
	else:
		parent.animations.offset = Vector2(32, 0)

func exit() -> void:
	super()
	parent.animations.offset = Vector2(0, 0)
	finished = false
	
func process_frame(delta: float) -> State:
	if finished:
		if Input.is_action_pressed('move_left') or Input.is_action_pressed('move_right'):
			return move_state
		return idle_state
	return null
	


func _on_animations_animation_finished() -> void:
	finished = true
