extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/Play.grab_focus()
	update_load_button_state()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	delete_checkpoint_file()
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_load_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func delete_checkpoint_file() -> void:
	var file_path = "res://checkpoint_data.cfg"
	if FileAccess.file_exists(file_path):
		var err = DirAccess.remove_absolute(file_path)
		if err == OK:
			print("Checkpoint file deleted successfully.")
		else:
			print("Failed to delete checkpoint file: ", err)
	else:
		print("Checkpoint file does not exist.")
		
func update_load_button_state() -> void:
	var file_path = "res://checkpoint_data.cfg"
	$VBoxContainer/Load.disabled = not FileAccess.file_exists(file_path)
