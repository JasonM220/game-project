extends State

@export
var idle_state: State
@export
var move_state: State

var finished = false
var next_attack = 1
var next_attack_queued: bool = false

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
	next_attack = 1
	next_attack_queued= false
	
func process_frame(delta: float) -> State:
	if finished:
		if next_attack_queued and next_attack <= 3:
			play_next_attack()
			return null
		if Input.is_action_pressed('move_left') or Input.is_action_pressed('move_right'):
			return move_state

		return idle_state
	return null

func process_input(event: InputEvent) -> State:
	if Input.is_action_pressed("attack") and !next_attack_queued:
		next_attack_queued = true
		next_attack += 1
	return null
	

func play_next_attack() -> void:
	if next_attack == 2:
		parent.animations.play("attack2")
	else:
		parent.animations.play("attack3")
	finished = false
	next_attack_queued = false

func _on_animations_animation_finished() -> void:
	finished = true
