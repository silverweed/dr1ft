extends Node

func _input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()

func _ready():
	randomize()
	
var high_score = -1

func get_high_score():
	return load_score()
	
func load_score():
	var f = File.new()
	var err = f.open_encrypted_with_pass("user://save.bin", File.READ, OS.get_unique_id())
	if err != 0:
		return 0
	var r = f.get_64()
	f.close()
	return r
	
func save_score(score):
	var f = File.new()
	f.open_encrypted_with_pass("user://save.bin", File.WRITE, OS.get_unique_id())
	f.store_64(score)
	f.close()