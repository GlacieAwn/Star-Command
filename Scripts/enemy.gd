class_name Enemy extends StaticBody2D

var health: int
var explosion_animation: PackedScene = preload("res://Objects/Effects/Explosion.tscn")

func Death() -> void:
	var explosion = explosion_animation.instantiate()
	get_parent().add_child(explosion)
	explosion.transform = self.global_transform
	self.queue_free()


func Update(_delta: float) -> void:
	if health == 0:
		Death()
	pass
