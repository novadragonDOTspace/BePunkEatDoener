extends Node3D
@onready var mm: MusicManager = $MusicManager
@export var placeholderSong: Song

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mm.load_song(placeholderSong)
	mm.play_song()
