extends CharacterBody2D

const SPEED = 10000.0

@onready var animatedSprite2D = $AnimatedSprite2D

func _ready():
	pass

func _process(delta):
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	updatePosition(input_direction, delta)
	updateAnimation(input_direction)

func updatePosition(input_direction: Vector2, delta: float) -> void:
	velocity = input_direction * SPEED * delta
	move_and_slide()

func updateAnimation(input_direction: Vector2) -> void:
	if (input_direction != Vector2.ZERO):
		if (input_direction.x < 0):
			animatedSprite2D.flip_h = true
		else:
			animatedSprite2D.flip_h = false
		animatedSprite2D.play("walk")
	else:
		animatedSprite2D.play("idle")
