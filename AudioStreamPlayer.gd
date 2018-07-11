extends AudioStreamPlayer


func start_drift():
	volume_db += 10
	
func stop_drift():
	volume_db -= 10
	
func fade_audio():
	while volume_db > -60:
		volume_db -= 0.5
		yield(get_tree(), "idle_frame")