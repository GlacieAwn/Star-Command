extends Area2D

@export var speed = -150
@onready var screen_size = get_viewport_rect().size

var explosion_sfx = preload("res://Audio/SFX/SFX_Explode.wav")

func _process(delta: float) -> void:
	$AnimatedSprite2D.play("default") # Play the default animation(Essentially just a palette swap but I'm too lazy to actually program it in manually)
	position.y += speed * delta # move the bullet upwards


func _on_body_entered(body: Node2D) -> void:
	var enemy:= body as Enemy
	if enemy == null:
		return
		
	enemy.health -= 1
	Global.audio_manager.play_sfx(explosion_sfx)
	self.queue_free()
	Global.player.cooldown = 0
