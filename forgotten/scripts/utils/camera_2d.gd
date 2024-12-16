extends Camera2D


func _ready() -> void:
	load_checkpoint_location()






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
