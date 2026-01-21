extends StaticBody2D

@export var speed = 50
var is_destroyed: bool = false
var explosion_animation: PackedScene = preload("res://Objects/Effects/Explosion.tscn")

func _ready() -> void:
	Global.asteroid = self

func _process(delta: float) -> void:
	position.y += speed * delta

	

func Death():
	var explosion = explosion_animation.instantiate()
	get_parent().add_child(explosion)
	explosion.transform = self.global_transform
	self.queue_free()
	print(explosion)
	
