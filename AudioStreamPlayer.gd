extends AudioStreamPlayer


func start_drift():
	volume_db += 10
	
func stop_drift():
	volume_db -= 10