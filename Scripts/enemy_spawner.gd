extends Node2D


@export var asteroid_timer_rate:float = 2
@onready var asteroid_instance = preload("res://Objects/Asteroid.tscn")
@onready var screen_size = get_viewport_rect().size

var asteroid_timer = Timer.new()
# TODO: Load other enemies that the spawner needs to spawn

func _ready() -> void:
	asteroid_timer.wait_time = asteroid_timer_rate
	asteroid_timer.autostart = true
	asteroid_timer.one_shot = false
	asteroid_timer.timeout.connect(spawn_asteroids)
	add_child(asteroid_timer)
	pass

func spawn_asteroids() -> void:
	if asteroid_instance == null:
		return
	
	var asteroid = asteroid_instance.instantiate()
	asteroid.position.x = randf_range(0, 255)
	asteroid.position.y = -50
	
	add_child(asteroid)

	print(asteroid.position)

func _process(_delta: float) -> void:
	# print("Asteroid timer: %f", asteroid_timer.time_left)
	randomize()
	pass
