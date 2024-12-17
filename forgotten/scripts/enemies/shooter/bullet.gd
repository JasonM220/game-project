class_name Bullet extends HurtBox

@export var timer: Timer
@export var deflect_sound: AudioStreamPlayer2D

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
	


func do_damage(a: Area2D) -> void:
	if a is HitBox and deflected:
		a.take_damage(1)
		queue_free()
	if a.is_in_group("DefendZone"):
		deflect_sound.play()
		if Input.is_action_pressed("DeflectUp"):
			print("defendUp")
			vertical_speed = 300
			horizontal_speed = 0
		else:
			direction *= -1
		deflected = true
		timer.start()
