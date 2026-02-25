extends Node

var gameplay_theme_modern = preload("res://Audio/Modern/Let's Go!.ogg")
var gameplay_theme_dmg = preload("res://Audio/DMG/Let's Go!.ogg")

enum GAME_STATE {
	TITLE,
	GAMEPLAY
}
var state: GAME_STATE = GAME_STATE.GAMEPLAY

func _ready() -> void:
	Global.game_manager = self
	
	# TODO: set up game states and select music to play based on state and mode(for dmg audio)
	match state:
		GAME_STATE.TITLE:
			pass
		GAME_STATE.GAMEPLAY:
			Global.audio_manager.play_music(gameplay_theme_dmg)
	
	
func _process(_delta: float) -> void: 
	#$Container/ScoreText.text = str(Global.score)
	#$Container/LivesText.text = str("*", Global.player.lives)
	
	# Update enemies speed values so that they update per the 
	# lifetime of the game, not the lifetime of the object
	
	#print(Global.score)
	pass
	
func _physics_process(_delta: float) -> void:
	Global.player.Update()
	
func process(delta: float) -> void:
	Global.asteroid.Update(delta)
	Global.ufo.Update(delta)

func clear_screen() -> void:
	for Node in $EnemySpawner/Enemies.get_children():
		Node.queue_free()
		
	if Global.player.is_dead == true:
		$EnemySpawner.queue_free()
	pass
