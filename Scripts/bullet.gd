extends Area2D

@export var speed = -200
@onready var screen_size = get_viewport_rect().size


func _process(delta: float) -> void:
	$AnimatedSprite2D.play("default")
	position.y += speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		# Global.asteroid.is_destroyed = true
		Global.asteroid.Death()
		self.queue_free()
		Global.player.cooldown = 0
