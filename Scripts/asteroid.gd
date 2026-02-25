extends Enemy

@onready var speed = 30

var is_destroyed: bool = false

func _ready() -> void:
	#Global.asteroid = self
	health = 1 # override the health vairable in the enemy class
	points_awarded = 100 # override the amount of points awarded from the enemy class
	Global.asteroid = self
	pass

func _process(delta: float) -> void:
	position.y += speed * delta
	
	if self.position.y >= Global.player.position.y:
		Global.player.Death()
		queue_free()

	Update(delta)
	pass
