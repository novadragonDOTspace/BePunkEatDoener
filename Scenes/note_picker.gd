extends Node3D

var green_mat = load("res://Scenes/green_mat.tres")
var yellow_mat = load("res://Scenes/yellow_mat.tres")
var red_mat = load("res://Scenes/red_mat.tres")

@export_range(1, 3) var line: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_set_material()
	set_process_input(true)

var is_pressed = false
	
func _set_material():
	match line:
		1:
			$MeshInstance3D.material_override = green_mat
		2:
			$MeshInstance3D.material_override = yellow_mat
		3:
			$MeshInstance3D.material_override = red_mat
	

func _input(event):
	match line:
		1:
			if event.is_action_pressed("ui_left"):
				is_pressed = true
			elif event.is_action_released("ui_left"):
				is_pressed = false
		2:
			if event.is_action_pressed("ui_up"):
				is_pressed = true
			elif event.is_action_released("ui_up"):
				is_pressed = false
		3:
			if event.is_action_pressed("ui_right"):
				is_pressed = true
			elif event.is_action_released("ui_right"):
				is_pressed = false
				
				
				
func _physics_process(_delta: float) -> void:
	if is_pressed:
		self.scale = Vector3(0.9, 0.9, 0.9)
	else:
		self.scale = Vector3(1,1,1)
