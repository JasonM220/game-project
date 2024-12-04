extends Bullet

var returning = false

func _on_timer_timeout() -> void:
	if !returning:
		direction *= -1
		returning = true
	else:
		queue_free()
	
	
func do_damage(a: Area2D) -> void:
	super(a)
	if a.is_in_group("Enemy") and returning:
		queue_free()
