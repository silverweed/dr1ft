extends AnimatedSprite

var speed
var orig_scale

func _ready():
	orig_scale = scale
	reshuffle()
	
func _process(delta):
	position.x += speed * delta
	if position.x < -50 and speed < 0 or position.x > 1100 and speed > 0:
		reshuffle()
		
func reshuffle():
	var r = rand_range(0.0, 1.0)
	if r < 0.5:
		position = Vector2(rand_range(1115, 4000), rand_range(35, 150))
		speed = -rand_range(50, 100)
		scale.x = orig_scale.x
	else:
		position = Vector2(rand_range(-4000, -1115), rand_range(35, 150))
		speed = rand_range(50, 100)
		scale.x = -orig_scale.x
	