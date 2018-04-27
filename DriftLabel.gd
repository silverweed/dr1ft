extends Label

onready var car = $"/root/Game/YSort/Car"
onready var score_label = $"/root/Game/ScoreLabel"

var drifting = false
var time = 0

var pulse = 8
var score = 0

func _process(delta):
	time += delta
	rect_position = car.position - Vector2(180, 100 + 30 * sin(time * pulse))
	if drifting:
		score += int(delta * 1000)
		text = "SCORE +" + str(score)
	
func on_drift():
	drifting = true
	visible = true
	pulse = 12

	
func stop_drift():
	visible = false
	score_label.update_score(score)
	score = 0
	drifting = false