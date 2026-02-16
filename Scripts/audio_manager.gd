extends Node

var gameplay_theme = preload("res://Audio/Modern/Let's Go!.ogg")

func _ready(	) -> void:
	if get_tree().current_scene.name == "Gameplay":
		$MusicPlayer.stream = gameplay_theme
		$MusicPlayer.play()
		pass
