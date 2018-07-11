extends 'PulseLabel.gd'


func _ready():
	var score = $"/root/Global".get_high_score()
	if score == 0:
		hide()
	else:
		text = "High score: " + str(score)