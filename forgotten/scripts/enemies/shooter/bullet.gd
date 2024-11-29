extends Area2D

@onready var timer: Timer = $Timer

var horizontal_speed = 300
var vertical_speed = 0
var direction : int

var deflected = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	position.x += horizontal_speed * direction * delta
	position.y += vertical_speed * delta * -1
	


func _on_timer_timeout() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "TileMap":
		queue_free()
	if body.name == "Vagabond":
		body.take_damage(1)
		queue_free()
	print(body.name)
	


func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("Enemy") and deflected:
		area.take_damage(1)
		queue_free()
	if area.is_in_group("DefendZone"):
		print("defend")
		if Input.is_action_pressed("DeflectUp"):
			print("defendUp")
			vertical_speed = 300
			horizontal_speed = 0
		else:
			direction *= -1
		deflected = true
		timer.start()
