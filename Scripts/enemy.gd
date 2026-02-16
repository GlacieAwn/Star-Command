class_name Enemy extends StaticBody2D

var health: int
var explosion_animation: PackedScene = preload("res://Objects/Effects/Explosion.tscn")
var points_awarded: int

var explosion_sfx = preload("res://Audio/SFX/SFX_Explode.wav")

func Death() -> void:
	var explosion = explosion_animation.instantiate()
	get_parent().add_child(explosion)
	explosion.transform = self.global_transform
	queue_free()


func Update(_delta: float) -> void:
	if health == 0:
		Global.score += points_awarded
		print(Global.score)
		Death()
	pass
