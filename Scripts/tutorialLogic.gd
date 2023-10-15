extends Node2D

const PLAYER_SCENE = preload("res://Scenes/Prefabs/player.tscn")
const BUTTON_SCENE = preload("res://Scenes/Prefabs/button.tscn")
const WELCOME_TUTORIAL_TEXT = "[center]Welcome in this tutorial ! To continue, press Enter ![/center]"
const LEARN_TO_MOVE_TEXT = "[center]To move, press arrows keys ![/center]"
const PRESS_BUTTON_TEXT = "[center]To finish a level, you need to press all the buttons at the same time ![/center]"
const CONTROL_MULTIPLE_PLAYER_TEXT = "[center]During the game, you will control multiple players ![/center]"
const CREATE_WALL_TEXT = "[center]You can create wall to resolve the enigm by left-clicking twice ![/center]"
const CANCEL_WALL_TEXT = "[center]You can cancel the creation of a wall by pressing Escape ![/center]"
const MAX_NB_WALL_TEXT = "[center]You have a limited number of wall by level ! Check the top left corner to see it ![/center]"
const END_TUTORIAL_TEXT = "[center]You can now start to play ![/center]"
const BUTTON_LOGIC_NODE_INDEX = 1
const PLAYER_GROUP_NODE_INDEX = 2

@onready var tutorialText = $tutorialText

var step: int = 0
var newStep: bool = true
var enterKeyReady: bool = true

func _ready():
	tutorialText.position = get_viewport_rect().size / 2 + Vector2(-tutorialText.size.x / 2, -200)
	
func _process(delta):
	if (newStep):
		match step:
			0:
				tutorialText.text = WELCOME_TUTORIAL_TEXT
			1:
				call("learnToMove")
			2:
				call("pressButton")
			3:
				call("controlMultiplePlayer")
			4:
				call("createWall")
			5:
				tutorialText.text = CANCEL_WALL_TEXT
			6:
				tutorialText.text = MAX_NB_WALL_TEXT
			7:
				tutorialText.text = END_TUTORIAL_TEXT
		newStep = false
	pass

func _input(event):
	if (event is InputEventKey
	&& event.as_text_key_label() == "Enter"):
		if (event.pressed && enterKeyReady):
			step += 1
			newStep = true
			enterKeyReady = false
		else:
			enterKeyReady = true

func learnToMove():
	instantiateNode(PLAYER_SCENE, 2, get_viewport_rect().size / 2)
	tutorialText.text = LEARN_TO_MOVE_TEXT

func pressButton():
	instantiateNode(BUTTON_SCENE, BUTTON_LOGIC_NODE_INDEX, get_viewport_rect().size / 2 + Vector2(0, 100))
	tutorialText.text = PRESS_BUTTON_TEXT

func controlMultiplePlayer():
	var nodeInstance = get_parent().get_child(PLAYER_GROUP_NODE_INDEX).get_child(0)
	instantiateNode(PLAYER_SCENE, PLAYER_GROUP_NODE_INDEX, nodeInstance.position + Vector2(100, 0))
	tutorialText.text = CONTROL_MULTIPLE_PLAYER_TEXT

func createWall():
	var nodeInstance = get_parent().get_node("buttonLogic/button")
	instantiateNode(BUTTON_SCENE, BUTTON_LOGIC_NODE_INDEX, nodeInstance.position + Vector2(200, 0))
	tutorialText.text = CREATE_WALL_TEXT
	

func instantiateNode(scene: Resource, nodeParent: int, playerPosition: Vector2):
	var newNode = scene.instantiate()
	newNode.position = playerPosition
	get_parent().get_child(nodeParent).add_child(newNode)


func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_retry_button_pressed():
	get_tree().reload_current_scene()
