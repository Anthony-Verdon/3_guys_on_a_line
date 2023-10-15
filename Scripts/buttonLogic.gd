extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func checkEndOfLevel():
	for button in get_children():
		if (!button.isPressed):
			return
	if (get_tree().current_scene.name != "tutorial"):
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
