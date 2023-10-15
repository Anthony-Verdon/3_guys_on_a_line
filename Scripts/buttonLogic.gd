extends Node2D

@onready var winText = $winText

@onready var buttonContainer = get_parent().get_node("HBoxContainer")
@onready var nbWallText = get_parent().get_node("createWall/nbWallText")

# Called when the node enters the scene tree for the first time.
func _ready():
	winText.position = get_viewport_rect().size / 2 + Vector2(-winText.size.x / 2, -200)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func checkEndOfLevel():
	for child in get_children():
		if (child.name != "winText" && !child.isPressed):
			return
	if (get_tree().current_scene.name != "tutorial"):
		winText.visible = true
		buttonContainer.position = winText.position + Vector2(0, winText.size.y + 10)
		nbWallText.visible = false
