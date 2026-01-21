class_name Enemy extends StaticBody2D

var explosion_animation: PackedScene = preload("res://Objects/Effects/Explosion.tscn")

func Death() -> void:
	var explosion = explosion_animation.instantiate()
	explosion.transform = self.global_transform
	await get_tree().create_timer(0.8).timeout
	self.queue_free()
	pass