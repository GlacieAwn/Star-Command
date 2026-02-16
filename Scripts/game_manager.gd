extends Node

func _ready() -> void:
	Global.game_manager = self
	
	
func _process(delta: float) -> void:
	$Container/ScoreText.text = str(Global.score)
	$Container/LivesText.text = str("*", Global.player.lives)
	
	# Update enemies speed values so that they update per the 
	# lifetime of the game, not the lifetime of the object
	
	#print(Global.score)
	pass
	

func clear_screen() -> void:
	for Node in $EnemySpawner/Enemies.get_children():
		Node.queue_free()
		
	if Global.player.is_dead == true:
		$EnemySpawner.queue_free()
	pass
