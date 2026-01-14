extends CharacterBody2D

@export var speed = 75
@onready var screen_size = get_viewport_rect().size

@onready var bullet_instance: PackedScene = preload("res://Objects/Bullet.tscn")

var cooldown = 0
func _physics_process(delta: float) -> void:
	var input_direction = Input.get_axis("Move_Left", "Move_Right")
	velocity.x = input_direction * speed

	move_and_slide()
	position.x = wrapf(position.x, 0, screen_size.x)
	print(cooldown)
	
	if cooldown > 0:
		cooldown -= 1
	elif cooldown == 0:
		cooldown = 0

	if Input.is_action_just_pressed("Shoot") and cooldown == 0:
		var bullet = bullet_instance.instantiate()
		owner.add_child(bullet)
		bullet.transform = global_transform
		cooldown = 50
