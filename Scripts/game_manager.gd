extends Node

var title_scene_loaded: bool = false
var gameplay_loaded: bool = false
var cur = 0

func _ready() -> void:
	Global.game_manager = self	
	
	if not title_scene_loaded:
		Global.audio_manager.play_music(Global.title_theme_dmg)
		var title_scene_instance = Global.scene_manager.load_scene("res://Scenes/Menus/Title.tscn", false)
		$SubViewport.add_child(title_scene_instance)
		title_scene_loaded = true

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Start") and not gameplay_loaded:
		Global.audio_manager.play_music(Global.gameplay_theme_dmg)
		var gameplay_scene_instance = Global.scene_manager.load_scene("res://Scenes/Gameplay.tscn", true)
		$SubViewport.add_child(gameplay_scene_instance)
		gameplay_loaded = true
	
	if gameplay_loaded:
		$UI/ScoreText.text = str(Global.score)
		$UI/LivesText.text = str("*", Global.player.lives)
	
	#print(Global.score)

func clear_screen() -> void:
	if gameplay_loaded:
		for node in $SubViewport/Gameplay/EnemySpawner/Enemies.get_children():
			node.queue_free()
