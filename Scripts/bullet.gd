extends Area2D

@export var speed = -200
@onready var screen_size = get_viewport_rect().size


func _process(delta: float) -> void:
    $AnimatedSprite2D.play("default")
    position.y += speed * delta