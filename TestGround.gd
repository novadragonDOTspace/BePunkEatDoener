class_name TestGRound
extends Node

var main_node: MainNode
var mm: MusicManager
@export var placeholderSong: Song
@export var placeHolderSprite: Texture2D
@onready var SongTimeLabel: Label = $Label



func _ready() -> void:
	main_node = get_parent()
	mm = main_node.mm
	mm.load_song(placeholderSong)
	mm.play_song()
	mm.r.beat.connect(beat)

func _physics_process(_delta: float) -> void:
	pass

func beat(_weh):
	print(_weh)
	for i in placeholderSong.Notes:
		if(i.time == _weh ):
			print("hahahahahahahaha")
			print(i.time," " ,i.row)
			var pos: Vector2 = Vector2(i.row * 100, mm.r.current_beat * 100)
			var sprite: Sprite2D =  Sprite2D.new()
			sprite.position = pos
			sprite.texture = placeHolderSprite
			add_child(sprite)


func _on_switch_to_good_pressed() -> void:
	mm.switch_mode(MusicManager.gameplay_level.GOOD)


func _on_switch_to_bad_pressed() -> void:
	mm.switch_mode(MusicManager.gameplay_level.BAD)
