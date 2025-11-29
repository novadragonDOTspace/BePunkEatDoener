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
	mm.play()

func _physics_process(_delta: float) -> void:
	for i in placeholderSong.Notes:
		if(i.time * 1000 == mm.songposition):
			print("hahahahahahahaha")
			var pos: Vector2 = Vector2(mm.songposition, mm.songposition)
			var sprite: Sprite2D =  Sprite2D.new()
			sprite.position = pos
			add_child(sprite)

	SongTimeLabel.text = "%s" % (mm.songposition/1000)


func _on_switch_to_good_pressed() -> void:
	mm.switch_mode("good")

func _on_switch_to_base_pressed() -> void:
	mm.switch_mode("base")

func _on_switch_to_bad_pressed() -> void:
	mm.switch_mode("bad")
