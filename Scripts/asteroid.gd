extends Enemy

@export var speed = 30
var is_destroyed: bool = false
func _ready() -> void:
	#Global.asteroid = self
	health = 1
	pass

func _process(delta: float) -> void:
	Update(delta)
	position.y += speed * delta
	
	print(health)	
