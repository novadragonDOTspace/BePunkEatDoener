class_name MusicManager
extends AudioStreamPlayer

enum gameplay_level {GOOD, BAD}

var start_time: float = 0;


var crotched: float:
	get:
		return 1/stream.BPM * 60
var offset: float = 0
var songposition: float:
	get:
		return (get_playback_position())

@onready var r: RhythmNotifier = $RhythmNotifier



func load_song(_song: Song):
	set_stream(_song.Audio)
	r.bpm = _song.BPM
	offset = _song.offset

func play_song():
	start_time = Time.get_ticks_msec()
	switch_mode(gameplay_level.BAD)
	play()
	r.running = true



func switch_mode(level: gameplay_level):
	var Stream: AudioStreamSynchronized = stream
	if level == gameplay_level.GOOD:
		Stream.set_sync_stream_volume(1, 0)
	if level == gameplay_level.BAD:
		Stream.set_sync_stream_volume(1, -100)
