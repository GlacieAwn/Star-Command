extends Node

var gameplay_theme_modern = preload("res://Audio/Modern/Let's Go!.ogg")
var gameplay_theme_dmg = preload("res://Audio/DMG/Let's Go!.ogg")

func _ready() -> void:
	Global.game_manager = self
	
	# iterate through the current scene, and play the appropriate music based on scene name and mode
	match get_tree().current_scene.name:
		"Gameplay":
			print("On the gameplay scene")
			if Global.dmg_mode:
				Global.audio_manager.play_music(gameplay_theme_dmg)
			else:
				Global.audio_manager.play_music(gameplay_theme_modern)
	
	
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
