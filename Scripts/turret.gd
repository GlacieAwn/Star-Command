extends CharacterBody2D

@export var speed = 50
@onready var screen_size = get_viewport_rect().size
@onready var bullet_instance: PackedScene = preload("res://Objects/Bullet.tscn")

var cooldown = 0 # Cooldown of the player's shooting to limit how many shots the player can use at a time
var input_direction = 0 
var acceleration = 0.18
var friction = 0.18

var lives = 3
var is_dead = false # flag for death. is used to signal to the Game Manager to hide all game objects if true and show the "Game Over" Text
var start_pos: Vector2 

var explosion_animation: PackedScene = preload("res://Objects/Effects/Explosion.tscn")

var explode_sfx = preload("res://Audio/SFX/SFX_Explode.wav")
var shoot_sfx = preload("res://Audio/SFX/SFX_Shoot.wav")
var death_sfx = preload("res://Audio/SFX/SFX_Player_Death.wav")

var audio_manager

func _ready()-> void:
	Global.player = self
	start_pos.y = 127
	start_pos.x = screen_size.x / 2
	
	
	
func _process(_delta: float) -> void:
	input_direction = Input.get_axis("Move_Left", "Move_Right")

func _physics_process(_delta: float) -> void:
	if input_direction != 0:
		velocity.x = lerp(velocity.x, input_direction * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0.0, friction)
	move_and_slide()
	position.x = wrapf(position.x, 0, screen_size.x) # Wrap the position around the screen so that when the player reaches 160 for instance, it loops back to 0. Normally modulos are used for this, but this godot has wrapf for that
	# print(cooldown)
	
	if cooldown > 0:
		cooldown -= 1
	elif cooldown == 0:
		cooldown = 0
		
	if lives == 0:
		is_dead = true # Set is_dead flag to true if player lost all lives

	if Input.is_action_just_pressed("Shoot") and cooldown == 0:
		Global.audio_manager.play_sfx(shoot_sfx)
		var bullet = bullet_instance.instantiate() # create a new instance of the bullet
		get_parent().add_child(bullet) # add it to this object as a child
		bullet.transform = global_transform # set it to this object's transform. Since the bullet is lower in the Z depth on the actual node properties, it appears behind the player
		cooldown = 50

func Death():
	Global.audio_manager.play_sfx(explode_sfx)
	Global.player.lives -= 1
	hide()
		
	var explosion = explosion_animation.instantiate()
	get_parent().add_child(explosion)
	explosion.transform = self.global_transform
	Global.game_manager.clear_screen()
	await get_tree().create_timer(0.5).timeout
	position.x = screen_size.x / 2
	show()
	print(is_dead)
	
	if is_dead:
		Global.audio_manager.play_sfx(death_sfx)
		Global.audio_manager.stop_music()
		hide()
		Global.game_manager.clear_screen()
		lives = 0
