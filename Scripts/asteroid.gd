extends StaticBody2D

@export var speed = 50

func _process(delta: float) -> void:
	position.y += speed * delta
