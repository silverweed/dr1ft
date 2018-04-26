extends Node

onready var s1 = $Street1;
onready var s2 = $Street2;
onready var s1start = s1.position.x
onready var s2start = s2.position.x

const OFF_THRESH = -2000

var off = 0
export var speed = 1000

func _process(delta):
	off = speed * delta
	var news1pos = s1.position.x - off
	var news2pos = s2.position.x - off
	
	if news1pos <= OFF_THRESH:
		news1pos += 6000
	elif news2pos <= OFF_THRESH:
		news2pos += 6000
		
	s1.position.x = news1pos
	s2.position.x = news2pos
	
