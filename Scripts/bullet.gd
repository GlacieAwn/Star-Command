extends Area2D

@export var speed = -150
@onready var screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
	$AnimatedSprite2D.play("default")
	position.y += speed * delta


func _on_body_entered(body: Node2D) -> void:
	var enemy:= body as Enemy
	if enemy == null:
		return
		
	enemy.health -= 1
	self.queue_free()
	Global.player.cooldown = 0
