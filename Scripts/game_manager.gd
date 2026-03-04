extends Node

# var gameplay_theme_modern = preload("res://Audio/Modern/Let's Go!.ogg")

var game_state: Global.GAME_STATE
var scene_instance: Node

func _ready() -> void:
	Global.game_manager = self	
	game_state = Global.GAME_STATE.TITLE

	match game_state:
		Global.GAME_STATE.TITLE:
			Global.audio_manager.play_music(Global.title_theme_dmg)
			pass
		
		Global.GAME_STATE.GAMEPLAY:
			Global.audio_manager.play_music(Global.gameplay_theme_dmg)
			pass
	
func _process(_delta: float) -> void: 

	match game_state:
		Global.GAME_STATE.TITLE:
			pass
		
		Global.GAME_STATE.GAMEPLAY:
			pass
		_:
			pass
	$UI/ScoreText.text = str(Global.score)
	$UI/LivesText.text = str("*", Global.player.lives)
	
	#print(Global.score)
	pass
	
func _physics_process(_delta: float) -> void:
	pass

func process(_delta: float) -> void:
	pass
	
func clear_screen() -> void:
	for Node in $SubViewport/Gameplay/EnemySpawner/Enemies.get_children():
		Node.queue_free()
		
	if Global.player.is_dead == true:
		$SubViewport/Gameplay/EnemySpawner.queue_free()
	pass
	
