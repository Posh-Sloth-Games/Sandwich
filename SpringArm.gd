#Attribution
#	Template:	Godot Engine (4.1); Character Body Default Script
#	Tutorial:	GDQuest; 3D Movement in Godot in Only 6 Minutes - https://youtu.be/UpF7wm0186Q; 
#				CC-By 4.0 - GDQuest and contributors - https://www.gdquest.com/
#				Note: The tutorial is outdated and needed modifications

extends SpringArm3D

@export var mouse_sensitivity := 0.05

# Called when the node enters the scene tree for the first time.
func _ready():
	top_level = true
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.x -= event.relative.y * mouse_sensitivity
		rotation_degrees.x = clamp(rotation_degrees.x, -90, 30)
		
		rotation_degrees.y -= event.relative.x * mouse_sensitivity
		rotation_degrees.y = wrapf(rotation_degrees.y, 0.0, 360.0)
		

