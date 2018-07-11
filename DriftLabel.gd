extends Label

onready var car = $"/root/Game/YSort/Car"
onready var score_label = $"/root/Game/ScoreLabel"

var drifting = false
var time = 0

var pulse = 8
var score = 0
var combo = 0

func _process(delta):
	time += delta
	combo += delta
	rect_position = car.position - Vector2(180, 100 + 30 * sin(time * pulse))
	if drifting:
		# score = 1000 * delta * combo^1.2
		score += int(delta * 1000 * 1.2 * pow(combo, 0.2))
		text = "SCORE +" + str(score)
	
func on_drift():
	drifting = true
	visible = true
	pulse = 12

	
func stop_drift():
	visible = false
	score_label.update_score(score)
	score = 0
	combo = 0
	drifting = false

func _on_Car_on_explode():
	if not visible: return
	
	var g = 1
	while g > 0.1:
		g = max(0.1, g - 0.01)
		set("custom_colors/font_color", Color(1, g, g, g))
		yield(get_tree(), "idle_frame")
