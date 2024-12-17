extends Shooter

func _ready() -> void:
	super()
	hurt_sound = EnemyHitSound
	bullet = Globals.bullet_types.Star
