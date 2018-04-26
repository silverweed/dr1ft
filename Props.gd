extends Node2D

onready var s1 = $P1;
onready var s2 = $P2;
onready var s1start = s1.position.x
onready var s2start = s2.position.x

const OFF_THRESH = -3000

var off = 0
export var speed = 600

func _process(delta):
	off = speed * delta
	var news1pos = s1.position.x - off
	var news2pos = s2.position.x - off
	
	if news1pos <= OFF_THRESH:
		news1pos += 5000
	elif news2pos <= OFF_THRESH:
		news2pos += 5000
		
	s1.position.x = news1pos
	s2.position.x = news2pos
	
