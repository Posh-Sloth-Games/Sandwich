extends Node2D

@export var mainGameScene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_continue_button_up():
	get_tree().paused = false


func _on_restart_button_up():
	get_tree().change_scene_to_file(mainGameScene.resource_path)


func _on_quit_button_up():
	get_tree().quit()
