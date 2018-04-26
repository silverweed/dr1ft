extends Label

const G_A = 145 / 255;
const G_B = 1;

# This is kinda in sync with the audio track, but has some, heh, drift
const PULSE = 4.05

var time = 0

func _process(delta):
	time += delta
	modulate.g = G_A + (G_B - G_A) * abs(sin(time * PULSE))