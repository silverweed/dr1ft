extends Label

var score = 0
var displayed_score = 0

func update_score(sum):
	score += sum
	do_update_score(sum / 10)
	
func do_update_score(step):
	while displayed_score < score:
		displayed_score = min(score, displayed_score + step)
		text = "SCORE: " + str(displayed_score)
		yield(get_tree(), "idle_frame")
		
func _exit_tree():
	if score > $"/root/Global".get_high_score():
		$"/root/Global".save_score(score)