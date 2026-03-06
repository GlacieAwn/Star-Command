extends Node

# var gameplay_theme_modern = preload("res://Audio/Modern/Let's Go!.ogg")

var game_state: Global.GAME_STATE
var cur = 0

func _ready() -> void:
	Global.game_manager = self	
	game_state = Global.GAME_STATE.GAMEPLAY

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
			var title_scene_instance = Global.scene_manager.load_scene("res://Scenes/Menus/Title.tscn", false)
			$SubViewport.add_child(title_scene_instance)

		Global.GAME_STATE.GAMEPLAY:
			$UI/ScoreText.text = str(Global.score)
			$UI/LivesText.text = str("*", Global.player.lives)
		_:
			pass
	
	#print(Global.score)
	pass
	
func _physics_process(_delta: float) -> void:
	pass

func process(_delta: float) -> void:
	pass
	
func clear_screen() -> void:

	if game_state == Global.GAME_STATE.GAMEPLAY:
		for node in $SubViewport/Gameplay/EnemySpawner/Enemies.get_children():
			node.queue_free()
	
	pass
	
