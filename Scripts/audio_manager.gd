extends Node

const MAX_STREAM_COUNT = 16

var stream_pool


func _ready(	) -> void:
	stream_pool = [MAX_STREAM_COUNT]
	Global.audio_manager = self
	
func _process(_delta: float) -> void:
	pass
		
		
func play_music(file: AudioStream) -> void:
	$MusicPlayer.stream = file
	$MusicPlayer.play()
	
func play_sfx(file: AudioStream) -> void:
	$SFX_Player.stream = file
	
	if $SFX_Player.playing:
		for i in MAX_STREAM_COUNT:
			var audio_player = AudioStreamPlayer2D.new()
			stream_pool.append(audio_player)
			add_child(stream_pool.get_items())
			audio_player.play()
	$SFX_Player.play()
	

func stop_music() -> void:
	$MusicPlayer.stop()
