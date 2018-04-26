extends Node

func _input(event):
	if event.is_action_pressed("change_scene"):
		get_tree().change_scene("res://Game.tscn");