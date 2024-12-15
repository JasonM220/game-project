extends Node

var last_location
var player


func _ready() -> void:
	player = get_parent().get_node("Vagabond")
	last_location= player.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
