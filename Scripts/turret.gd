extends CharacterBody2D

@export var speed = 75
@onready var screen_size = get_viewport_rect().size
@onready var bullet_instance: PackedScene = preload("res://Objects/Bullet.tscn")

var cooldown = 0
var input_direction = 0
var acceleration = 0.50
var friction = 0.5

func _ready() -> void:
	Global.player = self
func _process(_delta: float) -> void:
	input_direction = Input.get_axis("Move_Left", "Move_Right")

func _physics_process(_delta: float) -> void:
	if input_direction != 0:
		velocity.x = lerp(velocity.x, input_direction * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0.0, friction)
	move_and_slide()
	position.x = wrapf(position.x, 0, screen_size.x)
	# print(cooldown)
	
	if cooldown > 0:
		cooldown -= 1
	elif cooldown == 0:
		cooldown = 0

	if Input.is_action_just_pressed("Shoot") and cooldown == 0:
		var bullet = bullet_instance.instantiate()
		get_parent().add_child(bullet)
		bullet.transform = global_transform
		cooldown = 50
