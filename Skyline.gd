extends Sprite

const N_TICKS = 10
const T_BETWEEN_TICKS = 5
const SHIFT = 3

export var t = 0.0
var left = true
var ticks = 0

func _process(delta):
	t += delta
	if t >= T_BETWEEN_TICKS:
		position.x += (-SHIFT if left else SHIFT)
		ticks += 1
		t = 0
		if ticks == N_TICKS:
			ticks = 0
			left = !left