extends Node2D

@export var asteroid_timer_rate:float = 1.5
@export var ufo_timer_rate:float = 30.0
@onready var asteroid_instance = preload("res://Objects/Asteroid.tscn")
@onready var ufo_instance = preload("res://Objects/UFO.tscn")
@onready var screen_size = get_viewport_rect().size

var asteroid_timer = Timer.new()
var ufo_timer = Timer.new()
# TODO: Load other enemies that the spawner needs to spawn

func _ready() -> void:
	
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
	asteroid.position.y = -50
	get_owner().add_child(asteroid)

	# print(asteroid.position)a
	
func spawn_ufo() -> void:
	if ufo_instance == null:
		return
	var ufo = ufo_instance.instantiate()
	get_owner().add_child(ufo)

func _process(_delta: float) -> void:
	# print("Asteroid timer: %f", asteroid_timer.time_left)
	pass
