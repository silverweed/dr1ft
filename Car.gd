extends AnimatedSprite

onready var p1 = $Particles2D
onready var p2 = $Particles2D2

func _input(event):
	if event.is_action_pressed("drift"):
		play("drift")
		p1.emitting = true
		p2.emitting = true
			
	elif event.is_action_released("drift"):
		play("default")
		p1.emitting = false
		p2.emitting = false
