extends Enemy

@onready var speed = 30

var is_destroyed: bool = false
func _ready() -> void:
	#Global.asteroid = self
	health = 1 # override the health vairable in the enemy class
	points_awarded = 100 # override the amount of points awarded from the enemy class
	pass

func _process(delta: float) -> void:
	Update(delta)
	position.y += speed * delta
	
	# TODO Check if the asteroid hits the player's platform. 
	# If true, decrement the lives of the player. 
	if position.y >= Global.player.position.y:
		Global.player.Death()
		queue_free()
	#print(health)	
