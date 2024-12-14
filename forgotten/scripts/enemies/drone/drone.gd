class_name Drone extends Shooter

var max_distance = 100
var start_position: Vector2


func _ready() -> void:
	super._ready()
	start_position = global_position
	bullet = Globals.bullet_types.Vertical

	print(start_position)
	

func _physics_process(delta: float) -> void:
	var distance_traveled = global_position.distance_to(start_position)
	if distance_traveled == max_distance:
		if direction == 1:
			position.x -= 5
		else:
			position.x += 5
		direction *= -1
		animated_sprite.flip_h = (direction < 0)
	move_and_slide()
