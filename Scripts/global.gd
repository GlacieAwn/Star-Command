extends Node

var player
var asteroid
var ufo
var game_manager
var audio_manager
var enemy_spawner
var scene_manager

var score:int
var dmg_mode: bool = false

enum GAME_STATE {
	TITLE,
	OPTIONS,
	GAMEPLAY,
	PAUSE
}

# Preloaded Scenes

var explosion_animation: PackedScene = preload("res://Objects/Effects/Explosion.tscn")

# Preloaded Audio
var title_theme_dmg = preload("res://Audio/DMG/Title.ogg")
var gameplay_theme_dmg = preload("res://Audio/DMG/Let's Go!.ogg")

var explode_sfx = preload("res://Audio/SFX/SFX_Explode.wav")
var shoot_sfx = preload("res://Audio/SFX/SFX_Shoot.wav")
var death_sfx = preload("res://Audio/SFX/SFX_Player_Death.wav")