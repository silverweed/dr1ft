extends AnimatedSprite

var speed = rand_range(150, 500)
	
func _ready():
	modulate = Color(rand_range(0, 1), rand_range(0, 1), rand_range(0, 1))

func _process(delta):
	position.x -= speed * delta