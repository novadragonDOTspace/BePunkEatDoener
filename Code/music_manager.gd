class_name MusicManager
extends AudioStreamPlayer

var start_time: float = 0;


var crotched: float:
	get:
		return 1/stream.BPM * 60
var offset: float = 0
var songposition: float:
	get:
		return (Time.get_ticks_msec() - start_time) * pitch_scale - offset



func load_song(_song: Song):
	set_stream(_song.Audio)
	offset = _song.offset

func play_song():
	start_time = Time.get_ticks_msec()


func switch_mode(mode: String):
	if stream.is_meta_stream():
		var audiostream: AudioStreamPlaybackInteractive = get_stream_playback();
		audiostream.switch_to_clip_by_name(mode)
