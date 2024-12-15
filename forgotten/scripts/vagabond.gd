class_name Player
extends GameEntity



@onready
var state_machine = $state_machine

@export var hurt_sound : AudioStreamPlayer2D

var max_health = 3

var health = max_health

var checkpoint_manager

func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	state_machine.init(self)
	hit_box.Damaged.connect(take_damage)
	checkpoint_manager = get_parent().get_node("CheckpointManager")


func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
	
func take_damage(damage: int) -> void:
	if health > 0:
		health -= damage
		hurt_sound.play()
		if(health <= 0):
			state_machine.died()
