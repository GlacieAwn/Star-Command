extends Node2D

@export var asteroid_timer_rate:float = 1
@export var ufo_timer_rate:float = 30.0
@onready var asteroid_instance = preload("res://Objects/Asteroid.tscn")
@onready var ufo_instance = preload("res://Objects/UFO.tscn")
@onready var screen_size = get_viewport_rect().size

var asteroid_speed
var ufo_speed
var asteroid_timer = Timer.new()
var ufo_timer = Timer.new()
# TODO: Load other enemies that the spawner needs to spawn

func _ready() -> void:
	Global.enemy_spawner = self
	
	asteroid_timer.wait_time = asteroid_timer_rate
	asteroid_timer.autostart = true
	asteroid_timer.one_shot = false
	asteroid_timer.timeout.connect(spawn_asteroids)
	add_child(asteroid_timer)
	
	ufo_timer.wait_time = ufo_timer_rate
	ufo_timer.autostart = true
	ufo_timer.one_shot = false
	ufo_timer.timeout.connect(spawn_ufo)
	add_child(ufo_timer)

func spawn_asteroids() -> void:
	if asteroid_instance == null:
		return
	
	var asteroid = asteroid_instance.instantiate()
	asteroid.position.x = randf_range(0 + 16, screen_size.x - 16)
	asteroid.position.y = -16
	$Enemies.add_child(asteroid)
	asteroid_timer_rate -= 0.01
	
	# print(asteroid.position)a
	
func spawn_ufo() -> void:
	ufo_timer_rate -= 0.50
	if ufo_instance == null:
		return
	var ufo = ufo_instance.instantiate()
	$Enemies.add_child(ufo)

func _process(delta: float) -> void:
	# print("Asteroid timer: %f", asteroid_timer.time_left)
	asteroid_timer.wait_time = asteroid_timer_rate
	ufo_timer.wait_time = ufo_timer_rate
	
	if asteroid_timer_rate <= 0.8:
		asteroid_timer_rate = 0.8
	
	if ufo_timer_rate <= 10:
		ufo_timer_rate = 10
	
	pass
