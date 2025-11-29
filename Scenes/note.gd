extends MeshInstance3D

var green_mat = load("res://Scenes/green_mat.tres")
var yellow_mat = load("res://Scenes/yellow_mat.tres")
var red_mat = load("res://Scenes/red_mat.tres")

@export_range(1, 3) var line: int

func _ready():
	set_material()

func set_material():
	match line:
		1:
			$MeshInstance3D.material_override = green_mat
		2:
			$MeshInstance3D.material_override = yellow_mat
		3:
			$MeshInstance3D.material_override = red_mat
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
