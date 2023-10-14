extends Node2D

const MOUSE_BUTTON_LEFT = 1;
const WALL_SCENE = preload("res://Scenes/Prefabs/wall.tscn")
const WALL_TEXTURE = preload("res://Assets/Wall/wall_fill.png")
const TEXTURE_LENGTH = 32

var firstVertex: Vector2 = Vector2.ZERO
var wallCount: int = 0
var newWall = null
var collisionShape2D = null
var sprite2D = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	checkEscapeKey(event)
	checkMouseClick(event)

func checkEscapeKey(event):
	if (event is InputEventKey
	&& newWall != null
	&& event.as_text_key_label() == "Escape"):
		newWall.queue_free()
		newWall = null

func checkMouseClick(event):
	if (event is InputEventMouseButton
	&& event.button_index == MOUSE_BUTTON_LEFT
	&& event.pressed):
		if (newWall == null):
			firstVertex = event.position			
			initWall()
		else:
			createWall(event.position)
			newWall = null
	elif (event is InputEventMouseMotion && newWall != null):
		updateWallBlueprint(event.position)
	
func initWall():
	newWall = WALL_SCENE.instantiate()
	collisionShape2D = newWall.get_child(0)
	sprite2D = newWall.get_child(1)
	collisionShape2D.shape = SegmentShape2D.new()
	collisionShape2D.shape.a = Vector2(-1, -1)
	collisionShape2D.shape.b = Vector2(-1, -1)
	sprite2D.position = firstVertex
	sprite2D.rotation = Vector2.ZERO.angle()
	sprite2D.scale.x = Vector2.ZERO.length()
	add_child(newWall)

func createWall(secondVertex: Vector2):
	sprite2D.texture = WALL_TEXTURE
	collisionShape2D.shape.a = firstVertex	
	collisionShape2D.shape.b = secondVertex

func updateWallBlueprint(secondVertex: Vector2):
	var vector: Vector2 = secondVertex - firstVertex
	sprite2D.position = (firstVertex + secondVertex) / 2
	sprite2D.rotation = vector.angle()
	#6000 is an arbitrary value found by testing 
	sprite2D.scale.x = vector.length() / TEXTURE_LENGTH
