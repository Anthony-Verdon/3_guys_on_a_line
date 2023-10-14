extends Node2D

const MOUSE_BUTTON_LEFT = 1;
const WALL_SCENE = preload("res://Scenes/wall.tscn")

var firstVertex: Vector2 = Vector2.ZERO
var wallCount: int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if (event is InputEventMouseButton
	&& event.button_index == MOUSE_BUTTON_LEFT
	&& event.pressed):
		if (firstVertex == Vector2.ZERO):
			firstVertex = event.position
		else:
			var secondVertex: Vector2 = event.position
			initWall(firstVertex, secondVertex)
			firstVertex = Vector2.ZERO

func initWall(firstVertex: Vector2, secondVertex: Vector2):
	var vector: Vector2 = secondVertex - firstVertex
	var newWall = WALL_SCENE.instantiate()
	var collisionShape2D = newWall.get_child(0)
	var sprite2D = collisionShape2D.get_child(0)
	newWall.name = "Wall_" + str(wallCount)
	wallCount += 1
	collisionShape2D.shape = SegmentShape2D.new()
	collisionShape2D.shape.a = firstVertex
	collisionShape2D.shape.b = secondVertex
	sprite2D.position = (firstVertex + secondVertex) / 2
	sprite2D.rotation = vector.angle()
	#6000 is an arbitrary value found by testing 
	sprite2D.scale.x = vector.length() / 6000
	add_child(newWall)
