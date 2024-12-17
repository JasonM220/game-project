extends State

@onready var hurt_box: HurtBox = $"../../Interactions/HurtBox"

@export
var idle_state: State
@export
var move_state: State

var finished = false
var next_attack = 1
var next_attack_queued: bool = false

func enter() -> void:
	super()
	if parent.animated_sprite.flip_h:
		parent.animated_sprite.offset = Vector2(-32, 0)
		hurt_box.position = Vector2(-34, 0)
	else:
		parent.animated_sprite.offset = Vector2(32, 0)
		hurt_box.position = Vector2(0, 0)
	await get_tree().create_timer(0.075).timeout
	hurt_box.monitoring = true
	parent.animated_sprite.animation_finished.connect(_on_animations_animation_finished)
	parent.sword_sound.play()

func exit() -> void:
	super()
	parent.animated_sprite.offset = Vector2(0, 0)
	finished = false
	next_attack = 1
	next_attack_queued= false
	hurt_box.monitoring = false
	parent.animated_sprite.animation_finished.disconnect(_on_animations_animation_finished)
	

	
func process_frame(delta: float) -> State:
	if finished:
		hurt_box.monitoring = false
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
	hurt_box.monitoring = true
	if next_attack == 2:
		parent.animated_sprite.play("attack2")
	else:
		parent.animated_sprite.play("attack3")
	finished = false
	next_attack_queued = false
	parent.sword_sound.play()
	

func _on_animations_animation_finished() -> void:
	finished = true
