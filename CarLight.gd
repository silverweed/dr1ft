extends Light2D

onready var speed = $"/root/Game/Props".speed

func _process(delta):
	position.x -= delta * speed
	if position.x < -130:
		position.x = 130