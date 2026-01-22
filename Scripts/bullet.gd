extends Area2D

@export var speed = -200
@onready var screen_size = get_viewport_rect().size


func _process(delta: float) -> void:
	$AnimatedSprite2D.play("default")
	position.y += speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		if body.has_method("Death"):
			body.Death()
		self.queue_free()
		Global.player.cooldown = 0
