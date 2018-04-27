extends WorldEnvironment

const BASE = 0.6
const PULSE = 8.1
var time = 0

var drifting = false

func _process(delta):
	time += delta
	if drifting:
		environment.tonemap_exposure = BASE + 0.3 +  0.1 * abs(sin(time * PULSE))
	
func start_drift():
	drifting = true
	environment.tonemap_exposure = BASE + 0.3 + 0.1 * abs(sin(time * PULSE))
	
func stop_drift():
	environment.tonemap_exposure = BASE
	drifting = false