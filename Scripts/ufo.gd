extends Enemy
var speed = 50

func _ready() -> void:
	self.global_position.x = 144 + 16 # Set Object off screen on the X
	self.global_position.y = 14 # Set Object to the right fixed height
	health = 1 # override the health variable in the enemy class
	points_awarded = 500 #override the amount of points awarded from the enemy class
	
func _process(delta: float) -> void:
	#print("Health: %i", health)s
	Update(delta)

func Update(delta: float) -> void:
	self.position.x -= speed * delta
	speed += 0.01 * delta
	#await get_tree().create_timer(1).timeout
	#health = 0
	
	
	if health == 0:
		Global.score += points_awarded
		print(Global.score)
		Death()
	
