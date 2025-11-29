class_name MusicManager
extends AudioStreamPlayer

var BPM: float = 0
var crotched: float:
	get:
		return 1/BPM * 60
var offset: float = 0
var songposition: float:
	get:
		return AudioServer.get_time_since_last_mix() + get_playback_position() - offset


func load_song(_song: Song):
	set_stream(_song.Audio)
	BPM = _song.BPM
	offset = _song.offset
	
	
