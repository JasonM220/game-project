class_name Player
extends GameEntity



@onready
var state_machine = $state_machine
@onready var sword_sound: AudioStreamPlayer2D = $AudioStreamPlayer2Sword
@onready var health_bar: ProgressBar = $HealthBar




var checkpoint_manager

func _ready() -> void:
	health_bar.init_health(health)
	state_machine.init(self)
	checkpoint_manager = get_parent().get_node("CheckpointManager")
	load_checkpoint_location()
	if has_node("Camera2D"):
		var camera = $Camera2D
		camera.global_position = global_position


func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
	
func take_damage(damage: int) -> void:
	if health > 0:
		health -= damage
		health_bar.health = health
		hurt_sound.play()
		if(health <= 0):
			state_machine.died()
			
func load_checkpoint_location() -> void:
	var file_path = "res://checkpoint_data.cfg"
	var config_file = ConfigFile.new()

	# Check if the file exists
	if FileAccess.file_exists(file_path):
		# Load the file
		var err = config_file.load(file_path)
		if err == OK:
			# Get the saved location
			var saved_location = config_file.get_value("Checkpoint", "last_location", Vector2.ZERO)
			if saved_location != Vector2.ZERO:
				# Move the player to the saved location
				global_position = saved_location
				print("Loaded checkpoint location: ", saved_location)
		else:
			print("Failed to load checkpoint file: ", err)
	else:
		print("Checkpoint file does not exist.")
