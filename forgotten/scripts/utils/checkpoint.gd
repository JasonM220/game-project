extends Area2D

var checkpoint_manager


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	checkpoint_manager = get_parent().get_parent().get_node("CheckpointManager")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	checkpoint_manager.last_location = $RespawnPoint.global_position   
	save_checkpoint_location($RespawnPoint.global_position)

func save_checkpoint_location(location: Vector2) -> void:
	var config_file = ConfigFile.new()
	var file_path = "res://checkpoint_data.cfg"  # This is stored in the user's app data directory
	
	# Set the location in the config file
	config_file.set_value("Checkpoint", "last_location", location)
	
	# Save the config file
	var err = config_file.save(file_path)
	if err != OK:
		print("Failed to save checkpoint data: ", err)
