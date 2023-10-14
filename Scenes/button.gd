
extends Area2D

const BUTTON_RED_RELEASED_SPRITE = preload("res://Assets/Button/red_button_released.png")
const BUTTON_RED_PRESSED_SPRITE = preload("res://Assets/Button/red_button_pressed.png")

@onready var sprite2D = $Sprite2D
var isPressed: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if (body.is_in_group("player")):
		isPressed = true
		updateSprite()
		get_parent().checkEndOfLevel()


func _on_body_exited(body):
	if (body.is_in_group("player")):
		isPressed = false
		updateSprite()

func updateSprite():
	if (isPressed):
		sprite2D.texture = BUTTON_RED_PRESSED_SPRITE
	else:
		sprite2D.texture = BUTTON_RED_RELEASED_SPRITE		
	
