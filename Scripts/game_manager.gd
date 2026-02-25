extends Node

var gameplay_theme_modern = preload("res://Audio/Modern/Let's Go!.ogg")
var gameplay_theme_dmg = preload("res://Audio/DMG/Let's Go!.ogg")

func _ready() -> void:
	Global.game_manager = self	
	
func _process(_delta: float) -> void: 
	$Container/ScoreText.text = str(Global.score)
	$Container/LivesText.text = str("*", Global.player.lives)
	
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
