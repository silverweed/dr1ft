extends AnimatedSprite

onready var p1 = $Particles2D
onready var p2 = $Particles2D2

const MIN_Y = 385
const MAX_Y = 540
const MIN_X = 115
const MAX_X = 800

var spd = 400
var drifting = false

signal on_drift
signal on_stop_drift
	
func _input(event):
	if event.is_action_pressed("drift"):
		play("drift")
		p1.emitting = true
		p2.emitting = true
		drifting = true
		$DriftArea.monitoring = true
		emit_signal("on_drift")
			
	elif event.is_action_released("drift"):
		play("default")
		p1.emitting = false
		p2.emitting = false
		drifting = false
		$DriftArea.monitoring = false
		emit_signal("on_stop_drift")

func _process(delta):
	var speed = spd
	if drifting:
		speed = 100
		
	var pos = position;
	if Input.is_action_pressed("up"):
		pos.y -= delta * speed
	if Input.is_action_pressed("down"):
		pos.y += delta * speed
	if Input.is_action_pressed("left"):
		pos.x -= delta * speed
	if Input.is_action_pressed("right"):
		pos.x += delta * speed
	
	pos.y = clamp(pos.y, MIN_Y, MAX_Y)
	pos.x = clamp(pos.x, MIN_X, MAX_X)
	
	position = pos
	

func _on_Area2D_area_entered(area):
	game_over()
		
func game_over():
	set_process_input(false)
	set_process(false)
	play("explode")
	var timer = Timer.new()
	timer.wait_time = 1
	timer.connect("timeout", self, "go_to_gameover_screen")
	add_child(timer)
	timer.start()
	
func go_to_gameover_screen():
	get_tree().change_scene("res://GameOver.tscn")


func _on_DriftArea_area_entered(area):
	game_over()
