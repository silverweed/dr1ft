extends Node2D

const NPCCar = preload("res://NpcCar.tscn")

onready var car = $"/root/Game/YSort/Car"

var speed_boost = 0
var max_t = 7

func _ready():
	start_spawning()
	
func start_spawning():
	while true:
		spawn()
		yield(get_tree().create_timer(rand_range(1, max_t)), "timeout")
		max_t -= 0.05
		speed_boost += 5
		
func spawn():
	var y = rand_range(car.MIN_Y, car.MAX_Y)
	var npc = NPCCar.instance()
	npc.position.x = position.x
	npc.position.y = y
	npc.speed += speed_boost
	get_parent().call_deferred("add_child", npc)