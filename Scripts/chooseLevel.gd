extends Control


func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_level_one_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/levelOne.tscn")


func _on_level_two_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/levelTwo.tscn")


func _on_level_three_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/levelThree.tscn")


func _on_tutorial_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")	

