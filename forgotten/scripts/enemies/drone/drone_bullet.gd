extends Bullet

func _ready() -> void:
	super._ready()
	horizontal_speed = 0
	vertical_speed = -100


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
		elif a.is_in_group("DefendZoneRight"):
			direction = 1
			horizontal_speed = 300
			vertical_speed = 0
		else:
			direction = -1
			horizontal_speed = 300
			vertical_speed = 0
		deflected = true
		timer.start()
