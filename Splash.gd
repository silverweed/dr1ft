extends Node

func _input(event):
	if event.is_action_pressed("change_scene"):
		get_tree().change_scene("res://Game.tscn");
		
var time = 0

func _process(delta):
	time += delta
	if time > 3:
		$StartLabel.visible = true
		set_process(false)