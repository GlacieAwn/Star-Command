extends Node

var player
var asteroid
var ufo
var game_manager
var audio_manager
var enemy_spawner

var score:int
var dmg_mode: bool = false

enum GAME_STATE {
	TITLE,
	OPTIONS,
	GAMEPLAY,
	PAUSE
}