extends Control


func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_level_one_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/levelBlueprint.tscn")


func _on_tutorial_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")	
	pass # Replace with function body.
